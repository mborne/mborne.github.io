document.addEventListener("DOMContentLoaded", function(event) {
    document.querySelectorAll('a').forEach((link) => {
        if ( link.hostname !== location.hostname ){
            link.setAttribute('target', '_blank');
        }
    });
});
