package ru.nozhkin.data_service.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import ru.nozhkin.data_service.api.StudentDataApi;
import ru.nozhkin.data_service.data.Student;
import ru.nozhkin.data_service.data.StudentRepository;
import ru.nozhkin.data_service.model.StudentDataCreateRequest;
import ru.nozhkin.data_service.model.StudentDataResponse;

@RestController
@RequiredArgsConstructor
public class StudentController implements StudentDataApi {

    private final StudentRepository studentRepository;

    @Override
    public ResponseEntity<StudentDataResponse> createStudentDataInData(StudentDataCreateRequest request) {
        Student student = new Student();
        student.setName(request.getFullName());
        student.setPassport(request.getPassport());
        studentRepository.save(student);
        StudentDataResponse response = new StudentDataResponse();
        response.setId(student.getId());
        response.setFullName(student.getName());
        response.setPassport(student.getPassport());

        return ResponseEntity.status(200).body(response);
    }

  @Override
  public ResponseEntity<StudentDataResponse> getStudentDataByIdFromData(Long id) {
      Student student = studentRepository.findById(id)
              .orElseThrow(() -> new RuntimeException("Student not found with id: " + id));

      StudentDataResponse response = new StudentDataResponse();
      response.setId(student.getId());
      response.setFullName(student.getName());
      response.setPassport(student.getPassport());

      return ResponseEntity.ok(response);
  }
}
