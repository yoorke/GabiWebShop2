<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationSecondLevelItem.ascx.cs" Inherits="VivoShop.customControls.Navigation.NavigationSecondLevelItem" %>
<%@ Register Src="~/customControls/Navigation/Desktop/NavigationThirdLevelItem.ascx" TagName="NavigationThirdLevelItem" TagPrefix="Vivo" %>

<li class="megamenu__item  megamenu__item--with-submenu ">
    <%--<a href="">
        Boje
    </a>--%>
    <asp:HyperLink ID="lnkLink" runat="server"></asp:HyperLink>

    <asp:Repeater ID="rptSubCategoriesLevel3Col1" runat="server">
        <HeaderTemplate>
            <ul class="megamenu__links megamenu__links--level--1">
        </HeaderTemplate>
        <ItemTemplate>
            <Vivo:NavigationThirdLevelItem runat="server" Category="<%#Container.DataItem %>"></Vivo:NavigationThirdLevelItem>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</li>
