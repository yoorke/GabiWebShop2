<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="passwordReset.aspx.cs" Inherits="VivoShop.passwordReset" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageNotification/PageNotification.ascx" TagName="PageNotification" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false"></Vivo:DesktopHeader>

    <div class="site__body">
        <Vivo:PageHeader runat="server" Title="Kreiranje nove korisničke šifre"></Vivo:PageHeader>
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <asp:HiddenField ID="lblUserID" runat="server" />
                        <h5>Dobrodošli, <asp:Literal ID="lblUsername" runat="server"></asp:Literal></h5>
                        <p>Unesite novu korisničku šifru u polja ispod. <br />
                           Šifra mora da bude bar 6 karaktera dugačka i od toga mora da sadrži bar jedno malo
                            i veliko slovo i bar jedan broj.
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-8 col-lg-6 offset-lg-3">
                        <div class="form-group">
                            <label for='<%#txtPassword.ClientID %>'>Nova šifra</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for='<%#txtPasswordConfirm.ClientID %>'>Ponovite šifru</label>
                            <asp:TextBox ID="txtPasswordConfirm" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnChangePassword" runat="server" CssClass="btn btn-primary" OnClick="btnChangePassword_Click" Text="Kreiraj šifru" />
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <Vivo:PageNotification ID="pageNotification" runat="server"></Vivo:PageNotification>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
