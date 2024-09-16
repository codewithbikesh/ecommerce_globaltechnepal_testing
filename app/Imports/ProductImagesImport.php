<?php

namespace App\Imports;

use App\Models\ProductImages;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class ProductImagesImport implements ToCollection, WithHeadingRow, WithChunkReading
{
    use Importable;

    public function collection(Collection $rows)
    {
        foreach ($rows as $row) {
            $productCode = $row['product_code'];
            $imagePath = $row['image_path'];

            // Extract the image name from the path
            $originalImageName = basename($imagePath);
            
            $imageName = $originalImageName;

            $folderPath = public_path('productimages/' . $productCode);

            // Create the product folder if it does not exist
            if (!File::exists($folderPath)) {
                File::makeDirectory($folderPath, 0755, true);
            }

            $imageFullPath = $folderPath . '/' . $imageName;

            // Determine if imagePath is a local file or URL
            if (File::exists($imagePath)) {
                // For local files
                File::copy($imagePath, $imageFullPath);
            } elseif (filter_var($imagePath, FILTER_VALIDATE_URL)) {
                // For URLs
                $imageContent = file_get_contents($imagePath);
                if ($imageContent) {
                    file_put_contents($imageFullPath, $imageContent);
                }
            } else {
                // Handle unsupported image sources
                continue;
            }

            // Find or create the product image record
            $productImage = ProductImages::updateOrCreate(
                ['image_path' => 'productimages/' . $productCode . '/' . $originalImageName],
                ['product_code' => $productCode, 'image_path' => 'productimages/' . $productCode . '/' . $imageName]
            );

            // If an existing record was found, delete the old image file
            if ($productImage->wasRecentlyCreated) {
                // If this is a new record, it does not have an old image to delete
                continue;
            }

        }
    }

    public function chunkSize(): int
    {
        return 1000;
    }
}
