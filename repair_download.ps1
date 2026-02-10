$images = @{
    "assets/Images/Home/hero-bg.mp4" = "https://videos.pexels.com/video-files/5453621/5453621-hd_1920_1080_25fps.mp4"
    "assets/Images/Gallery/hero-bg.mp4" = "https://videos.pexels.com/video-files/5453621/5453621-hd_1920_1080_25fps.mp4"
    "assets/Images/Gems/royal-blue.jpg" = "https://images.unsplash.com/photo-1618251213426-5b3211516e8b"
    "assets/Images/Gems/green-tourmaline.jpg" = "https://images.unsplash.com/photo-1601121141461-9d623259b158"
    "assets/Images/Gallery/green-tourmaline.jpg" = "https://images.unsplash.com/photo-1601121141461-9d623259b158"
    "assets/Images/Home/sapphire-card.jpg" = "https://images.unsplash.com/photo-1618251213426-5b3211516e8b"
}

foreach ($path in $images.Keys) {
    if (Test-Path $path) {
         $size = (Get-Item $path).Length
         if ($size -lt 5000) { Remove-Item $path -Force }
    }
    
    if (-not (Test-Path $path)) {
        Write-Host "Downloading $path..."
        if ($path.EndsWith(".mp4")) {
             & curl.exe -L $images[$path] -o $path -A "Mozilla/5.0" -e "https://www.pexels.com/" --fail
        } else {
             & curl.exe -L $images[$path] -o $path -A "Mozilla/5.0" --fail
        }
    }
}
