/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnectDB;

import Dao.CategoriesDAO;
import Dao.CustomerDAO;
import Dao.EmployeeDAO;
import Dao.ManagerDAO;
import Dao.ItemDAO;
import Model.Categories;
import Model.Customer;
import Model.Employee;
import Model.Manager;
import Model.Item;


/**
 *
 * @author Administrator
 */
public class TestDB {
    public static void main(String[] args) {
//        CustomerDAO customerDAO = new CustomerDAO();
//        customerDAO.registerCustomer(new Customer("nhatk", "123", "gog", "nhatk", "huuanton@gmail.com", "0903"));
//        EmployeeDAO employeeDAO = new EmployeeDAO();
//        employeeDAO.registerEmployee(new Employee("nam", "123", "hoang", "nam", "nam@gmail.com", "0904"));
//        ManagerDAO managerDAO = new ManagerDAO();
//        managerDAO.registerManager(new Manager("hung", "123", "nguyen", "hung", "hung@gmail.com", "0905"));
//        CategoriesDAO categoriesDAO = new CategoriesDAO();
//        categoriesDAO.registerCategories(new Categories("Food"));
        CustomerDAO customerDAO = new CustomerDAO();
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        ItemDAO productsDAO = ItemDAO.getInstance();
        
//        System.out.println(productsDAO.getAllProductsWithCategory(2,(1 - 1) * 12, 12));
//        productsDAO.registerProduct(new Item("Dog House", 300000, 15, 3));
    }
}
