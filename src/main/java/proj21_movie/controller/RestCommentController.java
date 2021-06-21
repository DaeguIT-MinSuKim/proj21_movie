package proj21_movie.controller;

import java.io.IOException;
import java.net.URI;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_movie.dto.Comment;
import proj21_movie.dto.Movie;
import proj21_movie.exception.DuplicateMovieException;
import proj21_movie.service.CommentService;

@Controller
@RequestMapping("/api")
public class RestCommentController {
	
	@Autowired
	private CommentService service;
	
	@GetMapping("/comments")
	public ResponseEntity<Object> comments () {
		System.out.println("cinemas()");
		return ResponseEntity.ok(service.getLists());
	}
	
	@GetMapping("/comments/user/{comUser}")	// json으로 받기는 아직 못 함..
	public ResponseEntity<Object> commentUser (@PathVariable String comUser, HttpServletResponse response) throws IOException {
		List<Comment> comment = service.getCommentByUser(comUser);
		if (comment == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.status(HttpStatus.OK).body(comment);
	}
	
	// 영화번호로 검색(영화 마다 댓글 리스트)
	@GetMapping("/comments/movie/{movNo}")
	public ResponseEntity<Object> commentMovie(@PathVariable int movNo, HttpServletResponse response) {
		List<Comment> comment = service.getCommentByMovNo(new Movie(movNo));
		if (comment == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(comment);
	}
	
	// 한줄평 번호로 검색
	@GetMapping("/comments/{comNo}")	
	public ResponseEntity<Object> comment(@PathVariable int comNo, HttpServletResponse response) {
		Comment comment = service.getCommentByComNo(comNo);
		if (comment == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(comment);
	}
	
	
	// 아직 미구현 - 나중에 처리할 예정
//	@GetMapping("/comments/avgstar/{movNo}")	// json으로 받기는 아직 못함		
//	public ResponseEntity<Object> commentAvgStar(@PathVariable int movNo, HttpServletResponse response) {
//		Comment comment = service.getCommentAvgStar(new Comment(movNo));
//		if (comment == null) {
//			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
//		}
//		return ResponseEntity.ok(comment);
//	}
	
	@PostMapping("/comments")
	public ResponseEntity<Object> newComment(@RequestBody Comment comment) {
		System.out.println("newComment > " + comment);
		try {
			service.registComment(comment);
			URI uri = URI.create("/api/comments/" + comment.getComNo());
			return ResponseEntity.created(uri).body(comment.getComNo());
			
		} catch (DuplicateMovieException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
	
	@PatchMapping("/comments/{comNo}")
	public ResponseEntity<Object> updateComment(@PathVariable int comNo, @RequestBody Comment comment) {
		return ResponseEntity.ok(service.modifyComment(comment));
	}
	
	@DeleteMapping("/comments/{comNo}")
	public ResponseEntity<Object> deleteComment(@PathVariable int comNo) {
		return ResponseEntity.ok(service.removeComment(new Comment(comNo)));
	}
}