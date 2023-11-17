package org.zerock.seoulive.exception;


// 개발자가 만드는 컨트롤러의 핸들러 메소드에서 오류발생시
// 사용자 정의 예외객체로 Warapping해서 throw하기 위해 정의된 예외 클래스
public class ServiceException extends Exception{
    private static final long serialVersionUID = 1L;


    public ServiceException(String message) {

        super(message);
    } // Default Constructor

    public ServiceException(Exception orignalException) {

        super(orignalException);
    } // Default Constructor

} // end class
