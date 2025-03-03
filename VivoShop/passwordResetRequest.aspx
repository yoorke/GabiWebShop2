<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="passwordResetRequest.aspx.cs" Inherits="VivoShop.passwordResetRequest" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageNotification/PageNotification.ascx" TagName="PageNotification" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false"></Vivo:DesktopHeader>

    <div class="site__body">
        <Vivo:PageHeader runat="server" Title="Resetovanje korisničke šifre"></Vivo:PageHeader>
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-sm-8 offset-sm-4 col-md-6 offset-md-3 col-lg-4 offset-lg-4">
                        <div class="row">
                            <div class="col-12">
                                <p><strong>Unesite email adresu koju ste koristili prilikom kreiranja naloga.</strong></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for='<%#txtEmail.ClientID %>'>Email adresa:</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" OnClick="btnSend_Click" Text="Pošalji zahtev" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <Vivo:PageNotification ID="pageNotification" runat="server"></Vivo:PageNotification>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
