package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import dto.Board;

public interface BoardService {
	
	public void createBoard(Board board);
	
	public Board readBoard(int bno);
	
	public void updateBoard(Board board);
	
	public void deleteBoard(int bno);
	
	public List<Board> listAll();
	
	public void increaseViewcnt(int bno, HttpSession session);
}
