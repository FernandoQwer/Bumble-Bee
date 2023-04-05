/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import java.util.Date;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class LoanInstallment {
    private int installmentId;
    private int installmentNo;
    private String installmentStatus;
    private Date dueDate;

    public LoanInstallment(int installmentId, int installmentNo, String installmentStatus, Date dueDate) {
        this.installmentId = installmentId;
        this.installmentNo = installmentNo;
        this.installmentStatus = installmentStatus;
        this.dueDate = dueDate;
    }

    public int getInstallmentId() {
        return installmentId;
    }

    public void setInstallmentId(int installmentId) {
        this.installmentId = installmentId;
    }

    public int getInstallmentNo() {
        return installmentNo;
    }

    public void setInstallmentNo(int installmentNo) {
        this.installmentNo = installmentNo;
    }

    public String getInstallmentStatus() {
        return installmentStatus;
    }

    public void setInstallmentStatus(String installmentStatus) {
        this.installmentStatus = installmentStatus;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

}
