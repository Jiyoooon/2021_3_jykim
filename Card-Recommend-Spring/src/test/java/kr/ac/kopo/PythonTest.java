package kr.ac.kopo;

import java.io.IOException;

public class PythonTest {

	//java에서 python 파일 실행
	public void givenPythonScript_whenPythonProcessInvoked_thenSuccess() throws Exception {
		Process p= Runtime.getRuntime().exec("C:/develop/python/main.py");
	    p.waitFor();
	}
	public static void main(String[] args) throws Exception {
		Process p= Runtime.getRuntime().exec("C:/develop/python/main.py");
	    p.waitFor();
	}
}
