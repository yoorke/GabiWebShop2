<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationItemColumn.ascx.cs" Inherits="VivoShop.customControls.Navigation.NavigationItemColumn" %>
<%@ Register Src="~/customControls/Navigation/Desktop/NavigationSecondLevelItem.ascx" TagName="NavigationSecondLevelItem" TagPrefix="Vivo" %>

<%--Col1--%>
<div class="col-3">
    <asp:Repeater ID="rptSubCategoriesLevel2" runat="server">
        <HeaderTemplate>
            <ul class="megamenu__links megamenu__links--level--0">
        </HeaderTemplate>
        <ItemTemplate>
            <Vivo:NavigationSecondLevelItem runat="server" Category="<%#Container.DataItem %>"></Vivo:NavigationSecondLevelItem>            
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
</div>
