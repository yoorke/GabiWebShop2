<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="VivoShop._404" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <%--<Vivo:PageHeader ID="pageHeader" runat="server" />--%>

        <div class="block">
            <div class="container">
                <div class="not-found">
                    <div class="not-found__404">
                        Greška 404
                    </div>
                    <div class="not-found__content">
                        <h1 class="not-found__title">Stranica ne postoji</h1>
                        <p class="not-found__text">
                            Ne možemo da pronađemo stranicu koju tražite.<br>
                            Pokušajte da koristite pretragu.
                        </p>
                        <p class="not-found__text">
                            Kliknite na taster ispod kako bi otišli na početnu stranu
                        </p>
                        <a class="btn btn-secondary btn-sm" href="/">Idi na početnu stranu</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
