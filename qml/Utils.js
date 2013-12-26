.pragma library

Number.prototype.secondsToTimeString = function(addZeroes) {
    var absoluteSeconds = this;

    var days = Math.floor(absoluteSeconds / 86400);
    var hours = Math.floor((absoluteSeconds % 86400) / 3600);
    var minutes = Math.floor(((absoluteSeconds % 86400) % 3600) / 60);
    var seconds = ((absoluteSeconds % 86400) % 3600) % 60;

    var retStr = "";

    if (days > 0)
        retStr += days + "d "

    if (days > 0 || hours > 0)
        retStr += (addZeroes && hours < 10 ? "0" : "") + hours + "h "

    if (days > 0 || hours > 0 || minutes > 0)
        retStr += (addZeroes && minutes < 10 ? "0" : "") + minutes + "m "

    if (days > 0 || hours > 0 || minutes > 0 || seconds > 0)
        retStr += (addZeroes && seconds < 10 ? "0" : "") + seconds + "s "

    return retStr;
}
