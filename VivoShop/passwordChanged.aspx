<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="passwordChanged.aspx.cs" Inherits="VivoShop.passwordChanged" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false"></Vivo:DesktopHeader>
    <div class="site__body">
        <Vivo:PageHeader runat="server" Title=""></Vivo:PageHeader>
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-8 col-lg-8 offset-lg-2">
                        <div class="alert alert-success">
                            Vaša šifra je uspešno izmenjena.<br />Prijavite se na portal putem sledećeg linka: <a href="/prijava">Prijava</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
