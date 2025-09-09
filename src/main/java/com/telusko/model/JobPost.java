package com.telusko.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@Getter
public class JobPost {
    private int postid;
    private String PostProfile;
    private String PostDesc;
    private int ReqExperience;
    private List<String> PostTechStack;
}
