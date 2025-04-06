

import numpy as np
import cv2

class ChessboardCalibrator:
    def __init__(self,cbWidth,cbHeight):
        self.cbWidth = cbWidth
        self.cbHeight = cbHeight

        # termination criteria
        self.criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.1)

        # prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
        self.objp = np.zeros((self.cbHeight*self.cbWidth,3), np.float32)
        self.objp[:,:2] = np.mgrid[0:self.cbWidth,0:self.cbHeight].T.reshape(-1,2)

        # Arrays to store object points and image points from all the images.
        self.objpoints = [] # 3d point in real world space
        self.imgpoints = [] # 2d points in image plane.

        # Defined when camera is calibrated
        self.matrix = None
        self.distorsion = None
        self.accuracy = None
        self.debugImage = None

    def addImage(self,frame):
        self.debugImage = frame

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        ret, corners = cv2.findChessboardCorners(gray, (self.cbWidth,self.cbHeight),None)
        if ret == False:
            cv2.putText(
                self.debugImage,
                'Corners not found!',
                (10,100),                  # bottomLeftCornerOfText
                cv2.FONT_HERSHEY_SIMPLEX,  # font
                1,                         # fontScale
                (0,0,255),                 # fontColor
                2                          # lineType
            )
            return

        # add found points
        print("chessboard corners found")
        self.objpoints.append(self.objp)

        corners2 = cv2.cornerSubPix(gray,corners,(11,11),(-1,-1),self.criteria)
        self.imgpoints.append(corners2)
        # display the corners
        self.debugImage = cv2.drawChessboardCorners(
            self.debugImage,
            (self.cbWidth,self.cbHeight),
            corners2,
            ret
        )

        # try to calibrate
        print("Number of images : ",len(self.objpoints))
        if len(self.objpoints) > 10:
            self.accuracy, self.matrix, self.distorsion, rvecs, tvecs = cv2.calibrateCamera(
                self.objpoints,
                self.imgpoints,
                gray.shape[::-1],
                None,
                None
            )
            print("Calibration accuracy : ",self.accuracy)


class Application:
    def __init__(self):
        self.capture = cv2.VideoCapture(0)
        self.frame = None
        self.frameCount = 0
        self.calibrator = ChessboardCalibrator(7,7)

    def run(self):
        print("Starting robot eye... Press q to quit")

        while(True):
            waitKeyTime = 100
            ret, self.frame = self.capture.read()
            self.frameCount = self.frameCount + 1

            if self.calibrator.matrix is None:
                # calibrating...
                self.calibrator.addImage(self.frame)
                cv2.imshow('view',self.calibrator.debugImage)
                waitKeyTime = 1000
            else:
                # calibrated
                h, w = self.frame.shape[:2]
                newcameramtx, roi=cv2.getOptimalNewCameraMatrix(
                    self.calibrator.matrix,
                    self.calibrator.distorsion,
                    (w,h),
                    1,
                    (w,h)
                )
                undistorded = cv2.undistort(
                    self.frame,
                    self.calibrator.matrix,
                    self.calibrator.distorsion,
                    None,
                    newcameramtx
                )
                cv2.imshow('view',undistorded)

            # IO processing
            key = cv2.waitKey(waitKeyTime)
            if key == ord('c'):
                print("Calibrate on")
                calibrate = True
            elif key & 0xFF == ord('q'):
                break

        self.capture.release()
        cv2.destroyAllWindows()


application = Application()
application.run()
