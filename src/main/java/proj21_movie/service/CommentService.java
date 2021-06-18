package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Comment;
import proj21_movie.dto.Movie;

@Service
public interface CommentService {

	List<Comment> getLists();
	List<Comment> getCommentByUser(String user);
	
	// 영화 상세 페이지 평점 관련 추가
	List<Comment> getCommentByMovNo(Movie movNo);
	// 기본 한줄평 번호로 검색
	Comment getCommentByComNo(int comNo);
	
//	Comment getCommentAvgStar(Comment comment);		// 나중에 처리할 예정
	
	int registComment(Comment comment);
	int modifyComment(Comment comment);
	int removeComment(Comment comment);
}
