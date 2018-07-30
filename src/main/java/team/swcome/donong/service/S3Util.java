package team.swcome.donong.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;

public class S3Util {
	private static final Logger logger = LoggerFactory.getLogger(S3Util.class);
	
	private String accesskey = "AKIAJRWSCDHRF53AWIUQ";
	private String secreteKey = "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";
	
	private AmazonS3 s3Client;
	
	public S3Util() {
		System.out.println("here1");
		AWSCredentials credentials = new BasicAWSCredentials(accesskey, secreteKey);
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		this.s3Client = new AmazonS3Client(credentials, clientConfig);
		s3Client.setEndpoint("s3.ap-northeast-2.amazonaws.com");
	}
	
	public List<Bucket> getBucketList() {
		return s3Client.listBuckets();
	}
	
	public Bucket createBucket(String bucketName) {
		return s3Client.createBucket(bucketName);
	}
	
	public void createFolder(String bucketName, String folderName) {
		s3Client.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}

	public void fileUpload(String bucketName, String fileName, MultipartFile file) {
		String filePath = (fileName).replace(File.separatorChar, '/');
		
		ObjectMetadata metaData = new ObjectMetadata();
		metaData.setContentType(file.getContentType());
		metaData.setContentLength(file.getSize());
		metaData.setHeader("filename", file.getOriginalFilename());

		try {
			s3Client.putObject(bucketName, filePath, file.getInputStream(), metaData);
			logger.info("===============Upload custom file - Done!!!!!! ======================");
		} catch (AmazonServiceException e) {
			logger.info("Caught an AmazonServiceException from PUT requests, rejected reasons:");
			logger.info("Error Message: " + e.getMessage());
			logger.info("HTTP Status Code: " + e.getStatusCode());
			logger.info("AWS Error Code: " + e.getErrorCode());
			logger.info("Error Type: " + e.getErrorType());
			logger.info("Request ID: " + e.getRequestId());
		} catch (AmazonClientException e) {
			logger.info("Caught an AmazonClientException: ");
			logger.info("Error Message: " + e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void fileDelete(String bucketName, String fileName) {
		String imgName = (fileName).replace(File.separatorChar, '/');
		s3Client.deleteObject(bucketName, imgName);
		System.out.println("삭제 성공!!");
	}
	
	public String getFileURL(String bucketName, String fileName) {
		System.out.println("넘어오는 파일명 : " + fileName);
		String imgName = (fileName).replace(File.separatorChar, '/');
		return s3Client.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, imgName)).toString();
	}
	
	
}
