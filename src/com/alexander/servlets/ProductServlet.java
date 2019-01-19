package com.alexander.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alexander.beans.ProductDTO;
import com.alexander.services.ProductService;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		operation(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		operation(request, response);
	}

	// Gestiona las peticiones http de tipo GET y POST
	private void operation(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");

		if (action.equals("productsEnables"))
			getProductsEnable(request, response);
		else if (action.equals("productRegister"))
			register(request, response);
		else if (action.equals("productUpdate"))
			update(request, response);
		else if(action.equals("productDisable")) {
			disable(request, response);
		} else if(action.equals("productEnable")) {
			enable(request, response);
		}

	}
	
	// Habilita un producto
	private void enable(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		if(id == null || id.trim().equals("")) {
			request.setAttribute("msg", "Debe ingresar un id válido");
			
			try {
				request.getRequestDispatcher("/response.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				e1.printStackTrace();
			}
		} else {
			try {
				int idProduct = Integer.parseInt(id);
				
				ProductService service = new ProductService();
				service.changeStatusProduct(idProduct, 1);
				
				try {
					response.sendRedirect(String.format("%s/product/list-disabled.jsp", request.getContextPath()));
				} catch (IOException e) {
					e.printStackTrace();
				}
			} catch (NumberFormatException e) {
				request.setAttribute("msg", "El id debe ser un número");
				
				try {
					request.getRequestDispatcher("/response.jsp").forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
		}
	}
	
	// Deshabilita un producto
	private void disable(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		if(id == null || id.trim().equals("")) {
			request.setAttribute("msg", "Debe ingresar un id válido");
			
			try {
				request.getRequestDispatcher("/response.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				e1.printStackTrace();
			}
		} else {
			try {
				int idProduct = Integer.parseInt(id);
				
				ProductService service = new ProductService();
				service.changeStatusProduct(idProduct, 0);
				
				try {
					response.sendRedirect(String.format("%s/product/list.jsp", request.getContextPath()));
				} catch (IOException e) {
					e.printStackTrace();
				}
			} catch (NumberFormatException e) {
				request.setAttribute("msg", "El id debe ser un número");
				
				try {
					request.getRequestDispatcher("/response.jsp").forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
		}
	}
	
	// Actualiza un producto
	private void update(HttpServletRequest request, HttpServletResponse response) {
		ProductService service = new ProductService();
		String id = request.getParameter("id");
		
		ProductDTO prod = service.getProductById(Integer.parseInt(id));
		
		if(prod == null) {
			try {
				request.setAttribute("msg", String.format("El producto con id %s no existe", id));
				request.getRequestDispatcher("/product/update.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		} else {
			String description  = request.getParameter("description");
			String price = request.getParameter("price");
			String stock = request.getParameter("stock");
			String image= request.getParameter("image");
			
			
			if(description != null && description.trim() != "" &&	
			   price != null && price .trim() != "" &&
			   stock != null && stock.trim() != "" &&
			   image!= null && image.trim() != "") {
				
				prod.setId(Integer.parseInt(id));
				prod.setDescription(description);
				prod.setPrice(Double.parseDouble(price));
				prod.setStock(Integer.parseInt(stock));
				prod.setImage(image);
				
				int affectedRows = service.updateProduct(prod);

				if (affectedRows == -1) {
					request.setAttribute("msg", String.format("No se pudo actualizar el producto", id));
					try {
						request.getRequestDispatcher("/product/update.jsp").forward(request, response);
					} catch (ServletException | IOException e) {
						e.printStackTrace();
					}
				} else {
					System.out.println("Se actualizó el producto " + affectedRows);
					
					try {
						response.sendRedirect(String.format("%s/product/list.jsp", request.getContextPath()));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} else {
				try {
					request.setAttribute("msg","No ha ingresado datos válidos");
					request.getRequestDispatcher("/product/update.jsp").forward(request, response);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	

	// Registra un nuevo producto
	private void register(HttpServletRequest request, HttpServletResponse response) {
		ProductService service = new ProductService();
		ProductDTO prod = new ProductDTO();
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String image = request.getParameter("image");

		if (description != null && description.trim() != "" &&	
			price != null && price .trim() != "" &&
			stock != null && stock.trim() != "" &&
			image!= null && image.trim() != "") {
			
			prod.setDescription(description);
			prod.setPrice(Double.parseDouble(price));
			prod.setStock(Integer.parseInt(stock));
			prod.setImage(image);

			int affectedRows = service.registerProduct(prod);

			if (affectedRows == -1) {
				System.out.println("No se pudo registrar el productp");
			} else {
				System.out.println("Se registró el producto " + affectedRows);
			}
			
			try {
				response.sendRedirect(String.format("%s/product/list.jsp", request.getContextPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect(String.format("%s/product/register.jsp", request.getContextPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}
	}

	// Obtiene los productos habilitados
	private void getProductsEnable(HttpServletRequest request, HttpServletResponse response) {
		ProductService service = new ProductService();
		List<ProductDTO> products = service.getProductsByStatus(1);

		request.setAttribute("products", products);

		try {
			request.getRequestDispatcher(String.format("%s/product/list.jsp", request.getContextPath())).forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
