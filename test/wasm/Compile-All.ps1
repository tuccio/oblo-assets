# Set the output directory for compiled .wasm files
$outputDir = "./"

# Get all .cpp files in the current directory and subdirectories
$cppFiles = Get-ChildItem -Path . -Recurse -Filter *.cpp

# Compile each .cpp file to .wasm
foreach ($file in $cppFiles) {
    $inputPath = $file.FullName
    $outputFileName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name) + ".wasm"
    $outputPath = Join-Path -Path $outputDir -ChildPath $outputFileName

    Write-Host "Compiling $inputPath to $outputPath..."
    
    & clang --target=wasm32-wasi -nostdlib "-Wl,--no-entry" "-Wl,--export-all" -o $outputPath $inputPath

    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to compile $inputPath"
    }
}
