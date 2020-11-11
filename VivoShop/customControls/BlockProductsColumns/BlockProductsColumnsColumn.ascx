<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockProductsColumnsColumn.ascx.cs" Inherits="VivoShop.customControls.BlockProductsColumns.BlockProductsColumnsColumn" %>
<%@ Register Src="~/customControls/ProductControls/ProductCard/ProductCardControl.ascx" TagName="ProductCard" TagPrefix="Vivo" %>

<div class="col-4">
    <div class="block-header">
        <h3 class="block-header__title">
            <%--Top Rated Products--%>
            <asp:Literal ID="lblTitle" runat="server"></asp:Literal>
        </h3>
        <div class="block-header__divider"></div>
    </div>
    <div class="block-product-columns__column">
        <asp:Repeater ID="rptProducts" runat="server">
            <HeaderTemplate>
                <div class="block-product-columns__item">
            </HeaderTemplate>
            <ItemTemplate>
                <Vivo:ProductCard runat="server" AlternateCss="product-card--layout--horizontal" Product="<%#Container.DataItem %>" />
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>
