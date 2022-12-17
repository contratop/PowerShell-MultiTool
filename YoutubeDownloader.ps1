Clear-Host

$host.UI.RawUI.WindowTitle = "Youtube Content Downloader"

function workdirselect {

    if(test-path -path \downloads){
        $workdir = "./downloads"
        write-host "Work Directory set to $workdir"
    }
    else{
        write-host "Actual Path $pwd" -ForegroundColor Yellow
        Write-Warning "Download Directory not set"
        $create = Read-Host "Create Directory? (y/n)"
        if($create -eq "y"){
            New-Item -ItemType Directory -Path downloads
            $workdir = "downloads"
            write-host "Work Directory set to $workdir"
        }
        else{
            write-host "Please create a directory named 'downloads' in the current directory"
            pause
            exit
        }
    }
}

function checktydp {
    if(test-path -path yt-dlp.exe){
        write-host "YTDLP OK" -ForegroundColor Green
    }
    else{
        write-host "yt-dlp not found" -ForegroundColor Red
        write-host "Downloading yt-dlp..."
        Invoke-WebRequest -Uri "https://github.com/contratop/PowerDownloader/blob/main/yt-dlp.exe?raw=true" -outfile "yt-dlp.exe"
        if($?){
            write-host "yt-dlp downloaded" -ForegroundColor Green
        }
        else{
            write-host "yt-dlp download failed" -ForegroundColor Red
            pause
            exit
        }
    }
}

function checkffmpeg {
    if(test-path -path ffmpeg.exe){
        write-host "FFMPEG OK" -ForegroundColor Green
    }
    else{
        write-host "ffmpeg not found" -ForegroundColor Red
        write-host "Downloading ffmpeg..."
        Invoke-WebRequest -Uri "https://github.com/contratop/PowerDownloader/releases/download/Dependencies/ffmpeg.exe" -outfile "ffmpeg.exe"
        if($?){
            write-host "ffmpeg downloaded" -ForegroundColor Green
        }
        else{
            write-host "ffmpeg download failed" -ForegroundColor Red
            pause
            exit
        }
    }
}



















