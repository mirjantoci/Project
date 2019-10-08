
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class downloadPublic extends HttpServlet {
    public static final String FILE_SEPARATOR = System.getProperty("file.separator");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // The path below is the root directory of data to be
            // compressed.
            //String path = getServletContext().getRealPath("data");
    		String path = "C:\\Users\\Mirjan\\Desktop\\Repositories\\publicrepository";

            File directory = new File(path);
            String[] files = directory.list();

            // Checks to see if the directory contains some files.
            if (files != null && files.length > 0) {

                // Call the zipFiles method for creating a zip stream.
                byte[] zip = zipFiles(directory, files);

                // Sends the response back to the user / browser. The
                // content for zip file type is "application/zip". We
                // also set the content disposition as attachment for
                // the browser to show a dialog that will let user 
                // choose what action will he do to the sent content.
                ServletOutputStream sos = response.getOutputStream();
                response.setContentType("application/zip");
                response.setHeader("Content-Disposition", "attachment; filename=publicrepository");

                sos.write(zip);
                sos.flush();
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Compress the given directory with all its files.
     */
    private byte[] zipFiles(File directory, String[] files) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ZipOutputStream zos = new ZipOutputStream(baos);
        byte bytes[] = new byte[2048];

        for (String fileName : files) {
            FileInputStream fis = new FileInputStream(directory.getPath() + 
                ZipDownloadServlet.FILE_SEPARATOR + fileName);
            BufferedInputStream bis = new BufferedInputStream(fis);

            zos.putNextEntry(new ZipEntry(fileName));

            int bytesRead;
            while ((bytesRead = bis.read(bytes)) != -1) {
                zos.write(bytes, 0, bytesRead);
            }
            zos.closeEntry();
            bis.close();
            fis.close();
        }
        zos.flush();
        baos.flush();
        zos.close();
        baos.close();

        return baos.toByteArray();
    }
}

