
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.io.File,org.apache.commons.io.FileUtils,java.io.IOException, org.eclipse.jgit.api.Git, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.internal.storage.file.FileRepository"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SPM</title>
</head>
<body>
	<style>
body {
	text-align: center;
}

form {
	display: inline-block;
}
</style>
	<jsp:include page="header.jsp"></jsp:include>
	<%
		String s = request.getParameter("fileName");
		String repType = (String) request.getParameter("reptype");
		String rep;
		String repoDir;
		String repositoryType = "public";

		if (repType.equals(repositoryType)) {
			rep = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";
			repoDir = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/";

			String ver = request.getParameter("ver");

			//String newFolder = repoDir + "/" +ver+ "/" + s;
			//out.println(newFolder);

			//File myfile = new File(repoDir + s);
			//myfile.renameTo(new File(newFolder));
			//System.out.println(rep);

			String[] files = request.getParameterValues("fileName");
			int size = files.length;
			for (int i = 0; i < size; i++) {

				String newFolder = repoDir + "/" + ver + "/" + files[i];
				//out.println(newFolder);

				if (files[i].indexOf('/') >= 0) {
					String[] parts = files[i].split("/");
					String part1 = parts[1]; // 004
					newFolder = repoDir + "/" + ver + "/" + part1;

				}
				
				File myfile = new File(repoDir + files[i]);
				myfile.renameTo(new File(newFolder));
				System.out.println(rep);

			}

			final File localPath;
			try {

				Repository repository = new FileRepository(rep);
				localPath = repository.getWorkTree();

				try (Git git = new Git(repository)) {
					// create the file
					//File myFile = new File(repository.getDirectory().getParent(), "testfile");
					//if(!myFile.createNewFile()) {
					//   throw new IOException("Could not create file " + myFile);
					//}

					// Stage all files in the repo including new files
					git.add().addFilepattern(".").call();

					// and then commit the changes.
					git.commit().setMessage("Commit all changes including additions").call();

					// try(PrintWriter writer = new PrintWriter(myFile)) {
					//    writer.append("Hello, world!");
					//}

					// Stage all changed files, omitting new files, and commit with one command
					git.commit().setAll(true).setMessage("Commit changes to all files").call();

					System.out.println("Committed all changes to repository at " + repository.getDirectory());
				}
			} catch (Exception e) {
				System.out.println(e);
			}

			out.println("File moved successfully");

		}

		else {
			rep = (String) session.getAttribute("privateRepository");
			repoDir = "C:/Users/Thinkopen/Desktop/Repositories/" + (String) session.getAttribute("repPrivate");

			String ver = request.getParameter("ver");

			String[] files1 = request.getParameterValues("fileName");
			int size1 = files1.length;
			
			for (int i = 0; i < size1; i++) {

				String newFolder = repoDir + "/" + ver + "/" + files1[i];
				//out.println(repoDir + s);
				if (files1[i].indexOf('/') >= 0) {
					String[] parts = files1[i].split("/");
					String part1 = parts[1]; // 004
					newFolder = repoDir + "/" + ver + "/" + part1;

				}

				File myfile = new File(repoDir + "/" + files1[i]);
				myfile.renameTo(new File(newFolder));

			}
			
			
			

			System.out.println(rep);

			final File localPath;
			try {

				Repository repository = new FileRepository(rep);
				localPath = repository.getWorkTree();

				try (Git git = new Git(repository)) {
					// create the file
					//File myFile = new File(repository.getDirectory().getParent(), "testfile");
					//if(!myFile.createNewFile()) {
					//   throw new IOException("Could not create file " + myFile);
					//}

					// Stage all files in the repo including new files
					git.add().addFilepattern(".").call();

					// and then commit the changes.
					git.commit().setMessage("Commit all changes including additions").call();

					// try(PrintWriter writer = new PrintWriter(myFile)) {
					//    writer.append("Hello, world!");
					//}

					// Stage all changed files, omitting new files, and commit with one command
					git.commit().setAll(true).setMessage("Commit changes to all files").call();

					System.out.println("Committed all changes to repository at " + repository.getDirectory());
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			out.println("<h4>File moved successfully &#x1F600; </h4>");

		}
	%>

</body>
</html>