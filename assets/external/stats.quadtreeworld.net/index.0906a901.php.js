
        var settings = {"showIntro":1,"divId":"matomo-opt-out","useSecureCookies":1,"cookiePath":null,"cookieDomain":null,"useCookiesIfNoTracker":1,"useCookiesTimeout":10,"OptOutComplete":"Cookie d'exclusion install\u00e9. Vos visites sur ce site web ne seront PAS enregistr\u00e9es par notre outil d'analyse web.","OptOutCompleteBis":"Note\u00a0: si vous nettoyez vos cookies et supprimez le cookie d'exclusion, ou bien si vous changez d'ordinateur et\/ou de navigateur, il vous faudra de nouveau effectuer la proc\u00e9dure d'exclusion.","YouMayOptOut2":"Vous pouvez vous opposer au suivi de votre navigation sur ce site web.","YouMayOptOut3":"Cela prot\u00e9gera votre vie priv\u00e9e, mais emp\u00eachera \u00e9galement le propri\u00e9taire d'apprendre de vos actions et de cr\u00e9er une meilleure exp\u00e9rience pour vous et les autres utilisateurs.","OptOutErrorNoCookies":"La fonctionnalit\u00e9 de d\u00e9sactivation du suivi n\u00e9cessite que les cookies soient autoris\u00e9s.","OptOutErrorNotHttps":"La fonctionnalit\u00e9 de d\u00e9sactivation du suivi pourrait ne pas fonctionner car ce site n'a pas \u00e9t\u00e9 charg\u00e9 en HTTPS. Veuillez recharger la page pour v\u00e9rifier que le statut de ce suivi a bien \u00e9t\u00e9 chang\u00e9.","YouAreNotOptedOut":"Vous n'\u00eates pas exclu(e).","UncheckToOptOut":"D\u00e9cochez cette case pour vous exclure.","YouAreOptedOut":"Vous n'\u00eates actuellement pas suivi(e).","CheckToOptIn":"Cochez cette case si vous acceptez d'\u00eatre suivi.","OptOutErrorNoTracker":"La fonction de d\u00e9sactivation du suivi n'a pas pu trouver le code Matomo Tracker sur cette page"};          
        var checkForTrackerTried = 0;
        var checkForTrackerTries = (settings.useCookiesTimeout * 4);
        var checkForTrackerInterval = 250;
        var optOutDiv = null;
        
        function optOutInit() {
            optOutDiv = document.getElementById(settings.divId);
            if (optOutDiv) {
                optOutDiv.style.cssText += ''; // Appending css to avoid overwritting existing inline div styles
            } else {
                showContent(false, null, true); // will show unable to find opt-out div error
                return;                
            }
            checkForMatomoTracker();
        }
        
        function checkForMatomoTracker() {
            if (typeof _paq !== 'undefined') {
                showOptOutTracker();
                return;
            }
            
            if (checkForTrackerTried < checkForTrackerTries) {
                setTimeout(checkForMatomoTracker, checkForTrackerInterval);
                checkForTrackerTried++;
                return;
            }
            
            if (settings.useCookiesIfNoTracker) {
                showOptOutDirect();
                return;
            }
            
            console.log('Matomo OptOutJS: failed to find Matomo tracker after '+(checkForTrackerTries*checkForTrackerInterval / 1000)+' seconds');
        }
        
        function showOptOutTracker() {             
            _paq.push([function () {
                if (settings.cookieDomain) {
                    _paq.push(['setCookieDomain', settings.cookieDomain]);
                }
                if (settings.cookiePath) {
                    _paq.push(['setCookiePath', settings.cookiePath]);
                }
                if (this.isUserOptedOut()) {
                    showContent(false, null, true);
                } else {
                    showContent(true, null, true);
                }
            }]);
        }
        
        function showOptOutDirect() {
            window.MatomoConsent.init(settings.useSecureCookies, settings.cookiePath, settings.cookieDomain, settings.cookieSameSite);                
            showContent(window.MatomoConsent.hasConsent());
        }
        
        document.addEventListener('DOMContentLoaded', optOutInit());
        
        
        function showContent(consent, errorMessage = null, useTracker = false) {
    
            var errorBlock = '<p style="color: red; font-weight: bold;">';
    
            var div = document.getElementById(settings.divId);
            if (!div) {
                var warningDiv = document.createElement("div");
                var msg = 'Unable to find opt-out content div: "'+settings.divId+'"';
                warningDiv.id = settings.divId+'-warning';
                warningDiv.innerHTML = errorBlock+msg+'</p>';
                document.body.insertBefore(warningDiv, document.body.firstChild);
                console.log(msg);
                return;
            }
            
            if (!navigator || !navigator.cookieEnabled) {
                div.innerHTML = errorBlock+settings.OptOutErrorNoCookies+'</p>';
                return;
            }

            if (errorMessage !== null) {
                div.innerHTML = errorBlock+errorMessage+'</p>';
                return;
            }

            var content = '';        

            if (location.protocol !== 'https:') {
                content += errorBlock + settings.OptOutErrorNotHttps + '</p>';
            }

            if (consent) {
                if (settings.showIntro) {
                    content += '<p>'+settings.YouMayOptOut2+' '+settings.YouMayOptOut3+'</p>';                       
                }
                content += '<input id="trackVisits" type="checkbox" checked="checked" />';
                content += '<label for="trackVisits"><strong><span>'+settings.YouAreNotOptedOut+' '+settings.UncheckToOptOut+'</span></strong></label>';                               
            } else {
                if (settings.showIntro) {
                    content += '<p>'+settings.OptOutComplete+' '+settings.OptOutCompleteBis+'</p>';
                }
                content += '<input id="trackVisits" type="checkbox" />';
                content += '<label for="trackVisits"><strong><span>'+settings.YouAreOptedOut+' '+settings.CheckToOptIn+'</span></strong></label>';
            }                   
            div.innerHTML = content;      

            var tV = document.getElementById('trackVisits');
            if (consent) {
                if (useTracker) {
                    tV.addEventListener("click", function (e) {
                        _paq.push(['optUserOut']);
                        showContent(false, null, true);
                    });
                } else {
                    tV.addEventListener("click", function (e) {
                        window.MatomoConsent.consentRevoked();
                        showContent(false);
                    });
                }
            } else {
                if (useTracker) {
                    tV.addEventListener("click", function (e) {
                        _paq.push(['forgetUserOptOut']);
                        showContent(true, null, true);
                    });
                } else {
                    tV.addEventListener("click", function (e) {
                        window.MatomoConsent.consentGiven();
                        showContent(true);
                    });
                }
            }
        };   

        window.MatomoConsent = {                         
            cookiesDisabled: (!navigator || !navigator.cookieEnabled),        
            CONSENT_COOKIE_NAME: 'mtm_consent', CONSENT_REMOVED_COOKIE_NAME: 'mtm_consent_removed', 
            cookieIsSecure: false, useSecureCookies: true, cookiePath: '', cookieDomain: '', cookieSameSite: 'Lax',     
            init: function(useSecureCookies, cookiePath, cookieDomain, cookieSameSite) {
                this.useSecureCookies = useSecureCookies; this.cookiePath = cookiePath;
                this.cookieDomain = cookieDomain; this.cookieSameSite = cookieSameSite;
                if(useSecureCookies && location.protocol !== 'https:') {
                    console.log('Error with setting useSecureCookies: You cannot use this option on http.');             
                } else {
                    this.cookieIsSecure = useSecureCookies;
                }
            },               
            hasConsent: function() {
                var consentCookie = this.getCookie(this.CONSENT_COOKIE_NAME);
                var removedCookie = this.getCookie(this.CONSENT_REMOVED_COOKIE_NAME);
                if (!consentCookie && !removedCookie) {
                    return true; // No cookies set, so opted in
                }
                if (removedCookie && consentCookie) {                
                    this.setCookie(this.CONSENT_COOKIE_NAME, '', -129600000);              
                    return false;
                }                
                return (consentCookie || consentCookie !== 0);            
            },        
            consentGiven: function() {                                                        
                this.setCookie(this.CONSENT_REMOVED_COOKIE_NAME, '', -129600000);
                this.setCookie(this.CONSENT_COOKIE_NAME, new Date().getTime(), 946080000000);
            },      
            consentRevoked: function() {    
                this.setCookie(this.CONSENT_COOKIE_NAME, '', -129600000);
                this.setCookie(this.CONSENT_REMOVED_COOKIE_NAME, new Date().getTime(), 946080000000);                
            },                   
            getCookie: function(cookieName) {            
                var cookiePattern = new RegExp('(^|;)[ ]*' + cookieName + '=([^;]*)'), cookieMatch = cookiePattern.exec(document.cookie);
                return cookieMatch ? window.decodeURIComponent(cookieMatch[2]) : 0;
            },        
            setCookie: function(cookieName, value, msToExpire) {                       
                var expiryDate = new Date();
                expiryDate.setTime((new Date().getTime()) + msToExpire);            
                document.cookie = cookieName + '=' + window.encodeURIComponent(value) +
                    (msToExpire ? ';expires=' + expiryDate.toGMTString() : '') +
                    ';path=' + (this.cookiePath || '/') +
                    (this.cookieDomain ? ';domain=' + this.cookieDomain : '') +
                    (this.cookieIsSecure ? ';secure' : '') +
                    ';SameSite=' + this.cookieSameSite;               
                if ((!msToExpire || msToExpire >= 0) && this.getCookie(cookieName) !== String(value)) {
                    console.log('There was an error setting cookie `' + cookieName + '`. Please check domain and path.');                
                }
            }
        };                   