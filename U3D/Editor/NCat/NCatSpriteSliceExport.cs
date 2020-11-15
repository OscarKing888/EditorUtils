using UnityEngine;
using System.Collections;
using UnityEditor;
using System.IO;

static class NCatSpriteSliceExport
{
    [MenuItem("NCat/Sprite/Export Slice", true)]
    static bool ExportSpriteSliceToImageAllCheck()
    {
        return Selection.objects.Length != 0;
    }

    [MenuItem("NCat/Sprite/Export Slice")]
    public static void ExportSpriteSliceToImageAll()
    {
        string exportPath = "C:/SpriteExport/";
        if (!Directory.Exists(exportPath))
        {
            Directory.CreateDirectory(exportPath);
        }


        foreach (Object selObj in Selection.objects)
        {
            string folderName = selObj.name;
            string destPath = exportPath + folderName + "/";
            if (!Directory.Exists(destPath))
            {
                Directory.CreateDirectory(destPath);
            }

            Object[] sheet = AssetDatabase.LoadAllAssetsAtPath(AssetDatabase.GetAssetPath(selObj));

            foreach (Object obj in sheet)
            {
                Sprite sprite = obj as Sprite;
                if (sprite == null)
                {
                    continue;
                }

                Texture2D tex = sprite.texture;
                Rect r = sprite.textureRect;
                Texture2D subtex = tex.CropTexture((int)r.x, (int)r.y, (int)r.width, (int)r.height);
                byte[] data = subtex.EncodeToPNG();

                File.WriteAllBytes(destPath + sprite.name + ".png", data);
            }

            Debug.LogFormat("导出图块{0}到目录：{1}, 共：{2}张", folderName, destPath, sheet.Length);
        }

        Debug.LogFormat("导出图块到目录：{0}", exportPath);
        NCatUtil.ShowExplorer(exportPath);
    }

    /**
     * CropTexture
     * 
     * Returns a new texture, composed of the specified cropped region.
     */
    public static Texture2D CropTexture(this Texture2D pSource, int left, int top, int width, int height)
    {
        if (left < 0)
        {
            width += left;
            left = 0;
        }
        if (top < 0)
        {
            height += top;
            top = 0;
        }
        if (left + width > pSource.width)
        {
            width = pSource.width - left;
        }
        if (top + height > pSource.height)
        {
            height = pSource.height - top;
        }

        if (width <= 0 || height <= 0)
        {
            return null;
        }

        Color[] aSourceColor = pSource.GetPixels(0);

        //*** Make New
        Texture2D oNewTex = new Texture2D(width, height, TextureFormat.RGBA32, false);

        //*** Make destination array
        int xLength = width * height;
        Color[] aColor = new Color[xLength];

        int i = 0;
        for (int y = 0; y < height; y++)
        {
            int sourceIndex = (y + top) * pSource.width + left;
            for (int x = 0; x < width; x++)
            {
                aColor[i++] = aSourceColor[sourceIndex++];
            }
        }

        //*** Set Pixels
        oNewTex.SetPixels(aColor);
        oNewTex.Apply();

        //*** Return
        return oNewTex;
    }
}