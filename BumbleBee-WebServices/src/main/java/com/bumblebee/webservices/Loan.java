/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import java.util.Date;
import java.util.List;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class Loan {
    private int loanId;
    private int orderId;
    private double monthlyInstallment;    
    private double loanAmount;
    private String loanstatus;
    private String customerName;
    private String customerNIC;
    private String customerMobile;
    private Date loanDate;
    private List<LoanInstallment> loanInstallments;

    public Loan(int loanId, int orderId, double monthlyInstallment, double loanAmount, String loanstatus, String customerName, String customerNIC, String customerMobile, Date loanDate, List<LoanInstallment> loanInstallments) {
        this.loanId = loanId;
        this.orderId = orderId;
        this.monthlyInstallment = monthlyInstallment;
        this.loanAmount = loanAmount;
        this.loanstatus = loanstatus;
        this.customerName = customerName;
        this.customerNIC = customerNIC;
        this.customerMobile = customerMobile;
        this.loanDate = loanDate;
        this.loanInstallments = loanInstallments;
    }

    public int getLoanId() {
        return loanId;
    }

    public void setLoanId(int loanId) {
        this.loanId = loanId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public double getMonthlyInstallment() {
        return monthlyInstallment;
    }

    public void setMonthlyInstallment(double monthlyInstallment) {
        this.monthlyInstallment = monthlyInstallment;
    }

    public double getLoanAmount() {
        return loanAmount;
    }

    public void setLoanAmount(double loanAmount) {
        this.loanAmount = loanAmount;
    }

    public String getLoanstatus() {
        return loanstatus;
    }

    public void setLoastatus(String loastatus) {
        this.loanstatus = loastatus;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerNIC() {
        return customerNIC;
    }

    public void setCustomerNIC(String customerNIC) {
        this.customerNIC = customerNIC;
    }

    public String getCustomerMobile() {
        return customerMobile;
    }

    public void setCustomerMobile(String customerMobile) {
        this.customerMobile = customerMobile;
    }

    public Date getLoanDate() {
        return loanDate;
    }

    public void setLoanDate(Date loanDate) {
        this.loanDate = loanDate;
    }

    public List<LoanInstallment> getLoanInstallments() {
        return loanInstallments;
    }

    public void setLoanInstallments(List<LoanInstallment> loanInstallments) {
        this.loanInstallments = loanInstallments;
    }

}
