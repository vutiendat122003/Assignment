/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Vanxuan
 */
public class Admin {
    private  int adimId;
    private String adminName;

    public Admin() {
    }

    public Admin(int adimId, String adminName) {
        this.adimId = adimId;
        this.adminName = adminName;
    }

    public int getAdimId() {
        return adimId;
    }

    public void setAdimId(int adimId) {
        this.adimId = adimId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }
    
}
