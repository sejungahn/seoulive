package org.zerock.seoulive.board.course.domain;

import lombok.Data;
import lombok.extern.log4j.Log4j2;

import java.util.Date;

@Log4j2
//@Value
@Data
public class CourseCommVO {
    private Integer SEQ;
    private String WRITER;
    private String CONTENT;
    private Date WRITE_DATE;
    private Date MODIFY_DATE;
    private String BOARD_NAME;
    private Integer POST_SEQ;


    public CourseCommDTO toDTO() {
        log.trace("toDTO() invoked");

        CourseCommDTO dto = new CourseCommDTO();
//        dto.setSEQ(SEQ);
//        dto.setWRITER(WRITER);
//        dto.setCONTENT(CONTENT);
//
//        this.setWRITE_DATE(new Date());
//        dto.setWRITE_DATE(WRITE_DATE);
//
//
//        dto.setMODIFY_DATE(MODIFY_DATE);
//        dto.setBOARD_NAME(BOARD_NAME);
//        dto.setPOST_SEQ(POST_SEQ);

        log.info("\t dto: {}", dto);
        return dto;
    } //toDTO


} //end class