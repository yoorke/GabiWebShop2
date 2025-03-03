<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="accountNavigation.ascx.cs" Inherits="VivoShop.customControls.account.accountNavigation" %>
<div class="col-12 col-lg-3 d-flex">
    <div class="account-nav flex-grow-1">
        <h4 class="account-nav__title">Odaberi</h4>
        <ul>
            <li id="liDashboard" runat="server" class="account-nav__item">
                <a href="/moj-nalog">Kontrolna tabla</a>
            </li>
            <li id="liProfile" runat="server" class="account-nav__item">
                <a href="/moj-profil">Profil</a>
            </li>
            <li id="liOrderHistory" runat="server" class="account-nav__item">
                <a href="/istorija-porucivanja">Istorija poručivanja</a>
            </li>
            <li id="liEditPassword" runat="server" class="account-nav__item">
                <a href="/izmena-sifre">Izmena šifre</a>
            </li>
            <li class="account-nav__item">
                <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click">Odjava</asp:LinkButton>
            </li>
        </ul>
    </div>
</div>
