package br.com.casadocodigo.loja.infra;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
	
	public String write(String baseDir, MultipartFile file){
		String homePath = System.getProperty("user.home");
		
		String baseFolderPath = homePath + "/" + baseDir;
		String filePath = baseFolderPath + "/" + file.getOriginalFilename();
		
		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e);
		}
		return filePath;
		
	}
}
