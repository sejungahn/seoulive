package org.zerock.seoulive.exception;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@Log4j2
@NoArgsConstructor

//@ControllerAdvice      // For All packages
@ControllerAdvice(basePackages = {"org.zerock.myapp.controller"})   // For one package
public class ControllerExceptionHandler {


    // NullPointerException을 처리하는 예외처리 메소드
//    @ExceptionHandler(NullPointerException.class)
    @ExceptionHandler(ControllerException.class)
    String handleControllerException(Exception e, Model model) {
        log.trace("handleControllerException({}) invoked.", e);

        log.error("\t+ 1. Exeption Type : {}", e.getClass().getName());
        log.error("\t+ 2. Exeption Mesg : {}", e.getMessage());

        // 공유영역 중 Request Scope의 공유속성으로 바인딩
        model.addAttribute("__EXCEPTION__", e);

        // 컨트롤러의 핸들러 메소드와 동일한 뷰의 이름을 리턴
        return "errorPage";
    } // handleControllerException

    // Exception을 처리하는 예외처리 메소드
    @ExceptionHandler(Exception.class)
    String handleException(Exception e, Model model) {
        log.trace("handleException({}) invoked.", e);

        log.error("\t+ 1. Exeption Type : {}", e.getClass().getName());
        log.error("\t+ 2. Exeption Mesg : {}", e.getMessage());

        // 공유영역 중 Request Scope의 공유속성으로 바인딩
        model.addAttribute("__EXCEPTION__", e);

        // 컨트롤러의 핸들러 메소드와 동일한 뷰의 이름을 리턴
        return "errorPage";
    } // handleException

} // end class
