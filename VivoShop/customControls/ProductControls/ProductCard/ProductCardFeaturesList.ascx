<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCardFeaturesList.ascx.cs" Inherits="VivoShop.customControls.ProductControls.ProductCard.ProductCardFeaturesList" %>

<asp:Repeater ID="rptFeaturesList" runat="server">
    <HeaderTemplate>
        <ul class="product-card__features-list">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <asp:Literal runat="server" Text='<%#Eval("value") %>'></asp:Literal>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>