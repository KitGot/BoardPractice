package dao;

import java.util.List;

import dto.Board;

public interface BoardDAO {
	public void createBoard(Board board);

	public Board readBoard(int bno);

	public void updateBoard(Board board);

	public void increaseViewcnt(int bno);

	public List<Board> selectAllBoard();

	public void deleteBoard(int bno);
}
