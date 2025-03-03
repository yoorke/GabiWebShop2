<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HorizontalMenuThirdLevelItem.ascx.cs" Inherits="VivoShop.customControls.Navigation.Desktop.HorizontalMenuThirdLevelItem" %>
<asp:Repeater ID="rptCategories" runat="server">
    <HeaderTemplate>
        <ul class="megamenu__links megamenu__links--level--1">
    </HeaderTemplate>
    <ItemTemplate>
        <li class="megamenu__item">
            <asp:HyperLink runat="server" NavigateUrl='<%#Eval("Url") %>' Text='<%#Eval("Name") %>'></asp:HyperLink>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>