<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HorizontalMenuSecondLevel.ascx.cs" Inherits="VivoShop.customControls.Navigation.Desktop.HorizontalMenuSecondLevel" %>
<%@ Register Src="~/customControls/Navigation/Desktop/HorizotnalMenuSecondLevelItem.ascx" TagName="HorizontalMenuSecondLevelItem" TagPrefix="Vivo" %>

<div class="row">
    <div class="col-3">
        <Vivo:HorizontalMenuSecondLevelItem ID="SecondLevelColumn1" runat="server"></Vivo:HorizontalMenuSecondLevelItem>
    </div>
    <div class="col-3">
        <Vivo:HorizontalMenuSecondLevelItem ID="SecondLevelColumn2" runat="server"></Vivo:HorizontalMenuSecondLevelItem>
    </div>
    <div class="col-3">
        <Vivo:HorizontalMenuSecondLevelItem ID="SecondLevelColumn3" runat="server"></Vivo:HorizontalMenuSecondLevelItem>
    </div>
    <div class="col-3">
        <Vivo:HorizontalMenuSecondLevelItem ID="SecondLevelColumn4" runat="server"></Vivo:HorizontalMenuSecondLevelItem>
    </div>
</div>