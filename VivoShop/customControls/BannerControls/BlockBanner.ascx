<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockBanner.ascx.cs" Inherits="VivoShop.customControls.BannerControls.BlockBanner" %>
<div class="block block-banner">
    <div class="container">
        <%--<a href="" class="block-banner__body">--%>
        <asp:HyperLink ID="lnkBanner" runat="server" CssClass="block-banner__body">
            <div ID="divDesktop" runat="server" class="block-banner__image block-banner__image--desktop" style="background-image: url('images/banners/banner-1.jpg')"></div>
            <div ID="divMobile" runat="server" class="block-banner__image block-banner__image--mobile" style="background-image: url('images/banners/banner-1-mobile.jpg')"></div>
            <div class="block-banner__title text-white">
                <%--Veliki izbor<br class="block-banner__mobile-br">
                auto lakova i alata za farbanje--%>
                <asp:Literal ID="lblTitle" runat="server"></asp:Literal>
            </div>
            <div class="block-banner__text text-white">
                <%--Hammers, Chisels, Universal Pliers, Nippers, Jigsaws, Saws--%>
                <asp:Literal ID="lblText" runat="server"></asp:Literal>
            </div>
            <div class="block-banner__button">
                <span class="btn btn-sm btn-primary">
                    <%--Pogledaj odmah--%>
                    <asp:Literal ID="lblButtonText" runat="server"></asp:Literal>
                </span>
            </div>
        </asp:HyperLink>
        <%--</a>--%>
    </div>
</div>
