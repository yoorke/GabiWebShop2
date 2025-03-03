<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockCategoriesListItem.ascx.cs" Inherits="VivoShop.customControls.BlockCategories.BlockCategoriesListItem" %>
<div class="block-categories__item category-card category-card--layout--classic">
    <div class="category-card__body">
        <div class="category-card__image">
            <asp:Hyperlink ID="lnkImage" runat="server">
                <%--<img src="/images/categories/category-1.jpg" alt="">--%>
                <asp:Image ID="imgCategoryImage" runat="server" />
            </asp:Hyperlink>
        </div>
        <div class="category-card__content">
            <div class="category-card__name">
                <asp:Hyperlink ID="lnkCategory" runat="server">
                    <%--Farbanje--%>
                    <asp:Literal ID="lblCategoryName" runat="server"></asp:Literal>
                </asp:Hyperlink>
            </div>
            <asp:Repeater ID="rptSubCategories" runat="server">
                <HeaderTemplate>
                    <ul class="category-card__links">
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <asp:HyperLink ID="lnkSubCategory" runat="server" NavigateUrl='<%#Eval("url") %>' Text='<%#Eval("name") %>'></asp:HyperLink>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
            <div class="category-card__all">
                <asp:Hyperlink ID="lnkShowAll" runat="server">Prikaži sve</asp:Hyperlink>
            </div>
            <div class="category-card__products">
                <asp:Literal ID="lblProductsCount" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</div>
