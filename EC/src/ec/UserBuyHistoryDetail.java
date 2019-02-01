package ec;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyDataBeans;
import beans.DeliveryMethodDataBeans;
import beans.ItemDataBeans;
import dao.BuyDAO;
import dao.DeliveryMethodDAO;
import dao.ItemDAO;

/**
 * 購入履歴画面
 * @author d-yamaguchi
 *
 */
@WebServlet("/UserBuyHistoryDetail")
public class UserBuyHistoryDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String buyDate = request.getParameter("buyDate");
		String deliveryMethodName = request.getParameter("deliveryMethodName");
		int totalPrice =Integer.parseInt(request.getParameter("totalPrice"));
		int buyId =Integer.parseInt(request.getParameter("buyId"));
		request.setAttribute("buyDate", buyDate);
		request.setAttribute("deliveryMethodName", deliveryMethodName);
		request.setAttribute("totalPrice", totalPrice);
		HttpSession session = request.getSession();
		try {
		//配送情報を取得
		BuyDAO buyDao = new BuyDAO();
		BuyDataBeans userBuyData = buyDao.getBuyDataBeansByBuyId(buyId);
		request.setAttribute("userBuyData", userBuyData);
		// 購入商品一覧を取得
		ItemDAO itemDao = new ItemDAO();
		List<ItemDataBeans> userDeliveryMethod = itemDao.getItemDataBeansByBuyId(buyId);
		request.setAttribute("userDeliveryMethod", userDeliveryMethod);
		//配送情報を取得
		DeliveryMethodDAO dm = new DeliveryMethodDAO();
		DeliveryMethodDataBeans deliveryMethod =dm.getDeliveryMethodDataBeansByBuyId(buyId);
		request.setAttribute("deliveryMethod", deliveryMethod);
		request.getRequestDispatcher(EcHelper.USER_BUY_HISTORY_DETAIL_PAGE).forward(request, response);
		}catch (Exception e) {

		}
	}
}
