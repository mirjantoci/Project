import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class downloadAllFiles
 */
public class downloadAllFiles extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public downloadAllFiles() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			HttpSession session = request.getSession();

			// Set the content type based to zip
			response.setContentType("Content-type: text/zip");
			response.setHeader("Content-Disposition", "attachment; filename=mytest.zip");

			String repoDir1;

			repoDir1 = "C:/Users/Thinkopen/Desktop/Repositories/" + (String) session.getAttribute("repPrivate");

			// String filePath = repoDir1 + "/" + s;

			String[] lines = request.getParameterValues("mine");
			int size = lines.length;
			List<File> files = new ArrayList<File>();
			
				files.add(new File("C:/Users/Thinkopen/Desktop/Repositories/publicrepository/miri/test"));
			
			// List of files to be downloaded

			ServletOutputStream out = response.getOutputStream();
			ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(out));

			for (File file : files) {

				System.out.println("Adding " + file.getName());
				zos.putNextEntry(new ZipEntry(file.getName()));

				// Get the file
				FileInputStream fis = null;
				try {
					fis = new FileInputStream(file);

				} catch (FileNotFoundException fnfe) {
					// If the file does not exists, write an error entry instead of
					// file
					// contents
					zos.write(("ERRORld not find file " + file.getName()).getBytes());
					zos.closeEntry();
					System.out.println("Couldfind file " + file.getAbsolutePath());
					continue;
				}

				BufferedInputStream fif = new BufferedInputStream(fis);

				// Write the contents of the file
				int data = 0;
				while ((data = fif.read()) != -1) {
					zos.write(data);
				}
				fif.close();

				zos.closeEntry();
				System.out.println("Finishedng file " + file.getName());
			}

			zos.close();
		} catch (Exception e) {
		}
	}
}