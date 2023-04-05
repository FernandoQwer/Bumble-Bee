/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class LoanManager {

    private static LoanManager instance;

    // DB Connection
    Connection conn = DBUtil.getConnection();

    public static synchronized LoanManager getInstance() {
        if (instance == null) {
            instance = new LoanManager();
        }
        return instance;
    }

    // Get All Categories
    public List<Loan> getLoans() {
        List<Loan> loans = new ArrayList<>();
        try {
            String loanQuery = "SELECT l.id as loan_id, l.order_id, l.status AS loan_status, "
                    + "l.created_at AS loan_date, l.monthly_installment, c.first_name, c.last_name, "
                    + "c.mobile, c.nic, o.amount AS total_loan FROM loans AS l "
                    + "INNER JOIN orders o ON l.order_id = o.id "
                    + "INNER JOIN customer AS c ON o.customer_id = c.id";

            String loanInstallmentQuery = "SELECT li.id AS loan_installment_id, li.installment_no, "
                    + "li.status, li.due_date FROM loan_installments AS li WHERE li.loan_id = 1 "
                    + "ORDER BY li.installment_no ASC";

            // Loan
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(loanQuery);
            while (resultSet.next()) {
                int loanId = resultSet.getInt("loan_id");
                int orderId = resultSet.getInt("order_id");
                double totalLoan = resultSet.getDouble("total_loan");
                double monthlyInstallment = resultSet.getDouble("monthly_installment");
                String customerName = resultSet.getString("first_name") + " " + resultSet.getString("last_name");
                String customerMobile = resultSet.getString("mobile");
                String customerNic = resultSet.getString("nic");
                Date loanDate = resultSet.getDate("loan_date");
                String loanStatus = resultSet.getString("loan_status");
                List<LoanInstallment> loanInstallments = new ArrayList<>();

                // Loan Installments
                Statement statementTwo = conn.createStatement();
                ResultSet resultSetTwo = statementTwo.executeQuery(loanInstallmentQuery);

                while (resultSetTwo.next()) {
                    int loanInstallmentId = resultSetTwo.getInt("loan_installment_id");
                    int installmentNo = resultSetTwo.getInt("installment_no");
                    Date dueDate = resultSetTwo.getDate("due_date");
                    String installmentStatus = resultSetTwo.getString("status");

                    loanInstallments.add(new LoanInstallment(loanInstallmentId, installmentNo, installmentStatus, dueDate));
                }

                Loan loan = new Loan(loanId, orderId, monthlyInstallment, totalLoan, loanStatus, customerName, customerNic, customerMobile, loanDate, loanInstallments);
                loans.add(loan);
            }
        } catch (SQLException e) {
        }
        return loans;
    }

}
