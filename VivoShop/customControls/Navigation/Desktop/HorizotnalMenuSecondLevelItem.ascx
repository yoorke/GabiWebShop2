<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HorizotnalMenuSecondLevelItem.ascx.cs" Inherits="VivoShop.customControls.Navigation.Desktop.HorizotnalMenuSecondLevelItem" %>
<%@ Register Src="~/customControls/Navigation/Desktop/HorizontalMenuThirdLevelItem.ascx" TagName="HorizontalMenuThirdLevelItem" TagPrefix="Vivo" %>
<asp:Repeater ID="rptCategories" runat="server">
    <HeaderTemplate>
        <ul class="megamenu__links megamenu__links--level--0">
    </HeaderTemplate>
    <ItemTemplate>
        <li class="megamenu__item megamenu__item--with-submenu">
            <%--<a href="">--%>
            <asp:HyperLink runat="server" NavigateUrl='<%#Eval("Url") %>'>
                <asp:Literal ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Literal>
            </asp:HyperLink>
            <%--</a>--%>
            <Vivo:HorizontalMenuThirdLevelItem runat="server" Categories='<%#Eval("SubCategories") %>'></Vivo:HorizontalMenuThirdLevelItem>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>