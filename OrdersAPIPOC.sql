USE [OrdersAPIPOC]
GO
/****** Object:  Table [dbo].[TblexeOrder]    Script Date: 12/11/2019 11:58:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblexeOrder](
	[OrderUno] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](200) NOT NULL,
	[OrderCode] [nvarchar](100) NULL,
	[Quantity] [int] NULL,
	[CustomerUno] [int] NOT NULL,
	[Mobile] [nvarchar](100) NOT NULL,
	[StatusUno] [int] NOT NULL,
	[EnteredOn] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[CustomerName] [nvarchar](500) NULL,
	[ItemCode] [nvarchar](100) NULL,
	[ItemName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderUno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMstBranch]    Script Date: 12/11/2019 11:58:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMstBranch](
	[BranchUno] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](200) NOT NULL,
	[BranchName] [nvarchar](200) NOT NULL,
	[BranchCode] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Location] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchUno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMstCustomer]    Script Date: 12/11/2019 11:58:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMstCustomer](
	[CustomerUno] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](500) NOT NULL,
	[Mobile] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerUno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMstCustomerAuthorisation]    Script Date: 12/11/2019 11:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMstCustomerAuthorisation](
	[CustomerAuthUno] [int] IDENTITY(1,1) NOT NULL,
	[CustomerUno] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerAuthUno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMstInventory]    Script Date: 12/11/2019 11:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMstInventory](
	[InventoryUno] [int] IDENTITY(1,1) NOT NULL,
	[InventoryCode] [nvarchar](100) NOT NULL,
	[InventoryName] [nvarchar](500) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryUno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMstNUIStatus]    Script Date: 12/11/2019 11:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMstNUIStatus](
	[StatusUno] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](250) NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusUno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblexeOrder] ON 
GO
INSERT [dbo].[TblexeOrder] ([OrderUno], [OrderID], [OrderCode], [Quantity], [CustomerUno], [Mobile], [StatusUno], [EnteredOn], [Active], [CustomerName], [ItemCode], [ItemName]) VALUES (1, N'ORD201912110001', N'OC001', 2, 1007, N'050123121', 2, CAST(N'2019-12-11T23:43:08.347' AS DateTime), 1, N'Customer001', N'I001', N'Test Order up')
GO
INSERT [dbo].[TblexeOrder] ([OrderUno], [OrderID], [OrderCode], [Quantity], [CustomerUno], [Mobile], [StatusUno], [EnteredOn], [Active], [CustomerName], [ItemCode], [ItemName]) VALUES (2, N'ORD201912110002', N'OC002', 2, 1008, N'050123122', 2, CAST(N'2019-12-11T23:32:05.403' AS DateTime), 1, N'Customer002', N'I002', N'Test Order')
GO
INSERT [dbo].[TblexeOrder] ([OrderUno], [OrderID], [OrderCode], [Quantity], [CustomerUno], [Mobile], [StatusUno], [EnteredOn], [Active], [CustomerName], [ItemCode], [ItemName]) VALUES (3, N'ORD201912110003', N'OC003', 2, 1008, N'050123122', 4, CAST(N'2019-12-11T23:33:10.430' AS DateTime), 0, N'Customer002', N'I003', N'Test Order 3')
GO
INSERT [dbo].[TblexeOrder] ([OrderUno], [OrderID], [OrderCode], [Quantity], [CustomerUno], [Mobile], [StatusUno], [EnteredOn], [Active], [CustomerName], [ItemCode], [ItemName]) VALUES (4, N'ORD201912110004', N'OC004', 1, 1009, N'050123124', 2, CAST(N'2019-12-11T23:45:47.210' AS DateTime), 1, N'Customer004', N'I004', N'Test Order 4')
GO
SET IDENTITY_INSERT [dbo].[TblexeOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[TblMstBranch] ON 
GO
INSERT [dbo].[TblMstBranch] ([BranchUno], [BrandName], [BranchName], [BranchCode], [Active], [Location]) VALUES (1, N'Tommy Hilfiger ', N'Tommy Hilfiger Men', N'AP0001', 1, N'Sahara center,Sharjah,UAE')
GO
INSERT [dbo].[TblMstBranch] ([BranchUno], [BrandName], [BranchName], [BranchCode], [Active], [Location]) VALUES (2, N'Tommy Hilfiger ', N'Tommy Hilfiger Women', N'AP0002', 1, N'Dubai Mall,Dubai,UAE')
GO
SET IDENTITY_INSERT [dbo].[TblMstBranch] OFF
GO
SET IDENTITY_INSERT [dbo].[TblMstCustomer] ON 
GO
INSERT [dbo].[TblMstCustomer] ([CustomerUno], [CustomerName], [Mobile], [Active]) VALUES (1007, N'Customer001', N'050123121', 1)
GO
INSERT [dbo].[TblMstCustomer] ([CustomerUno], [CustomerName], [Mobile], [Active]) VALUES (1008, N'Customer002', N'050123122', 1)
GO
INSERT [dbo].[TblMstCustomer] ([CustomerUno], [CustomerName], [Mobile], [Active]) VALUES (1009, N'Customer004', N'050123124', 1)
GO
SET IDENTITY_INSERT [dbo].[TblMstCustomer] OFF
GO
SET IDENTITY_INSERT [dbo].[TblMstCustomerAuthorisation] ON 
GO
INSERT [dbo].[TblMstCustomerAuthorisation] ([CustomerAuthUno], [CustomerUno], [UserName], [Password], [Active]) VALUES (1, 1, N'Sherlock', N'pass@word1', 1)
GO
INSERT [dbo].[TblMstCustomerAuthorisation] ([CustomerAuthUno], [CustomerUno], [UserName], [Password], [Active]) VALUES (2, 2, N'John', N'pass@word2', 1)
GO
INSERT [dbo].[TblMstCustomerAuthorisation] ([CustomerAuthUno], [CustomerUno], [UserName], [Password], [Active]) VALUES (3, 3, N'Elsa', N'pass@word3', 1)
GO
INSERT [dbo].[TblMstCustomerAuthorisation] ([CustomerAuthUno], [CustomerUno], [UserName], [Password], [Active]) VALUES (4, 4, N'Susan', N'pass@word4', 1)
GO
SET IDENTITY_INSERT [dbo].[TblMstCustomerAuthorisation] OFF
GO
SET IDENTITY_INSERT [dbo].[TblMstInventory] ON 
GO
INSERT [dbo].[TblMstInventory] ([InventoryUno], [InventoryCode], [InventoryName], [Quantity], [Active]) VALUES (1, N'I001', N'LEATHER TRAINERS M', 18, 1)
GO
INSERT [dbo].[TblMstInventory] ([InventoryUno], [InventoryCode], [InventoryName], [Quantity], [Active]) VALUES (2, N'I002', N'FLIP-FLOPS M', 18, 1)
GO
INSERT [dbo].[TblMstInventory] ([InventoryUno], [InventoryCode], [InventoryName], [Quantity], [Active]) VALUES (3, N'I003', N'COTTON SHIRT M', 18, 1)
GO
INSERT [dbo].[TblMstInventory] ([InventoryUno], [InventoryCode], [InventoryName], [Quantity], [Active]) VALUES (4, N'I004', N'COLOUR-BLOCKED SHIRT M', 19, 1)
GO
INSERT [dbo].[TblMstInventory] ([InventoryUno], [InventoryCode], [InventoryName], [Quantity], [Active]) VALUES (5, N'I005', N'PEBBLE BACKPACK W', 20, 1)
GO
INSERT [dbo].[TblMstInventory] ([InventoryUno], [InventoryCode], [InventoryName], [Quantity], [Active]) VALUES (6, N'I006', N'CREDIT CARD HOLDER W', 20, 1)
GO
INSERT [dbo].[TblMstInventory] ([InventoryUno], [InventoryCode], [InventoryName], [Quantity], [Active]) VALUES (7, N'I007', N'PURE CASHMERE MONOGRAM SCARF W', 20, 1)
GO
INSERT [dbo].[TblMstInventory] ([InventoryUno], [InventoryCode], [InventoryName], [Quantity], [Active]) VALUES (8, N'I008', N' PLATFORM T BAR SHOES W', 20, 1)
GO
SET IDENTITY_INSERT [dbo].[TblMstInventory] OFF
GO
SET IDENTITY_INSERT [dbo].[TblMstNUIStatus] ON 
GO
INSERT [dbo].[TblMstNUIStatus] ([StatusUno], [StatusName], [Active]) VALUES (1, N'New', 1)
GO
INSERT [dbo].[TblMstNUIStatus] ([StatusUno], [StatusName], [Active]) VALUES (2, N'InProgress', 1)
GO
INSERT [dbo].[TblMstNUIStatus] ([StatusUno], [StatusName], [Active]) VALUES (3, N'Completed', 1)
GO
INSERT [dbo].[TblMstNUIStatus] ([StatusUno], [StatusName], [Active]) VALUES (4, N'Cancelled', 1)
GO
SET IDENTITY_INSERT [dbo].[TblMstNUIStatus] OFF
GO
ALTER TABLE [dbo].[TblexeOrder]  WITH CHECK ADD  CONSTRAINT [fk_CustomerUno] FOREIGN KEY([CustomerUno])
REFERENCES [dbo].[TblMstCustomer] ([CustomerUno])
GO
ALTER TABLE [dbo].[TblexeOrder] CHECK CONSTRAINT [fk_CustomerUno]
GO
/****** Object:  StoredProcedure [dbo].[SpGetOrder]    Script Date: 12/11/2019 11:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SREEJA E
-- Create date: 11 Dec 2019
-- Description:	Orders
-- exec dbo.SpGetOrder 'ORD0003'
-- =============================================
CREATE   PROCEDURE [dbo].[SpGetOrder]
	-- Add the parameters for the stored procedure here
 @OrderId nvarchar(100)=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 DECLARE @ServerTime datetime=GetDate(),@StatusUno int=2;
    IF ISNULL(@OrderId,'')<>''
	BEGIN
	
	select OrderUno,OrderID,OrderCode, Quantity, CustomerUno,Mobile,CustomerName,ItemCode,ItemName,StatusName ,EnteredOn from TblexeOrder 
	INNER JOIN TblMstNUIStatus on TblMstNUIStatus.StatusUno=TblexeOrder.StatusUno
	where OrderID=@OrderId and TblexeOrder.Active=1
	Order by TblexeOrder.StatusUno,EnteredOn

	UPDATE TblexeOrder set StatusUno=@StatusUno where OrderID=@OrderId and TblexeOrder.Active=1 and StatusUno in(1)
	END
	ELSE
	BEGIN
	

		select OrderUno,OrderID,OrderCode, Quantity, CustomerUno,Mobile,CustomerName,ItemCode,ItemName,StatusName,EnteredOn  from TblexeOrder 
	INNER JOIN TblMstNUIStatus on TblMstNUIStatus.StatusUno=TblexeOrder.StatusUno 
	where TblexeOrder.StatusUno in(1,2) and TblexeOrder.Active=1
	Order by TblexeOrder.StatusUno desc,EnteredOn 

	UPDATE TblexeOrder set StatusUno=@StatusUno where  TblexeOrder.Active=1 and StatusUno in(1)
	END
	 
END
GO
/****** Object:  StoredProcedure [dbo].[SpInsOrder]    Script Date: 12/11/2019 11:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SREEJA E
-- Create date: 11 Dec 2019
-- Description:	Orders
-- exec dbo.SpInsOrder 0,'7','Test','0501231231','I001','test',2,0,''
-- =============================================
CREATE PROCEDURE [dbo].[SpInsOrder]
	-- Add the parameters for the stored procedure here
	 @OrderUno int,
	 @OrderCode nvarchar(100),
	 @CustomerName nvarchar(500),
	 @Mobile nvarchar(100),
	 @ItemCode nvarchar(100),
	 @ItemName nvarchar(500),
	 @Quantity int,
	 @OutParameter int OUTPUT,
	 @OutMessage nvarchar(Max) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
BEGIN TRY
DECLARE @ServerTime datetime=GetDate(),@StatusUno int=1,@OrderID nvarchar(100)='',@MaxCount int=0,@CustomerUno int=0,@AvailableItemCount int=0,@OldOrderQuantity int=0,@OldItemCode nvarchar(50);
IF @OrderUno=0
BEGIN
SET @MaxCount=ISNULL((SELECT COUNT(*) from TblexeOrder 	WHERE CAST(EnteredOn as Date) =CONVERT(DATE, GETDATE())) ,1);
SET @OrderID= 'ORD'+CONVERT(char(4), DATEPART(YYYY,getdate())) + CONVERT(char(2), DATEPART(mm,getdate()))+CONVERT(char(2),DATEPART(dd,getdate()))+
					 RIGHT('0000' + CAST((@MaxCount+1) as nvarchar), 4)
					  
SET @CustomerUno =ISNULL( (SELECT CustomerUno from TblMstCustomer where CustomerName=@CustomerName and Mobile=@Mobile and Active=1),0);
IF @CustomerUno=0 --Check for Customer
BEGIN
INSERT INTO TblMstCustomer(CustomerName,Mobile,Active) values(@CustomerName,@Mobile,1)
SET @CustomerUno=SCOPE_IDENTITY();
END
--Check for Inventory
SET @AvailableItemCount= ISNULL((SELECT Quantity FROM TblMstInventory where InventoryCode=@ItemCode and Active=1),0);
IF @AvailableItemCount>@Quantity
BEGIN
INSERT INTO TblexeOrder (OrderID,OrderCode,Quantity,CustomerUno,Mobile,StatusUno,EnteredOn,Active,CustomerName,ItemCode,ItemName)
 values(@OrderID,@OrderCode,@Quantity,@CustomerUno,@Mobile,@StatusUno,@ServerTime,1,@CustomerName,@ItemCode,@ItemName)
SET @OutParameter=SCOPE_IDENTITY();
 
set @OutMessage='Order Placed Successfully with ORDER ID :'+@OrderID;
if @OutParameter>0
	BEGIN
	 update TblMstInventory set Quantity= (Quantity-@Quantity) where InventoryCode=@ItemCode and   Active=1
	END
END
ELSE
BEGIN
SET @OutParameter=0;
set @OutMessage='Item(s) are currently out of Stock';
END
END
ELSE -- update Order
BEGIN

SET @CustomerUno =ISNULL( (SELECT CustomerUno from TblMstCustomer where CustomerName=@CustomerName and Mobile=@Mobile and Active=1),0);
IF @CustomerUno=0 --Check for Customer
BEGIN
INSERT INTO TblMstCustomer(CustomerName,Mobile,Active) values(@CustomerName,@Mobile,1)
SET @CustomerUno=SCOPE_IDENTITY();
END
--Check for Inventory
SET @AvailableItemCount= ISNULL((SELECT Quantity FROM TblMstInventory where InventoryCode=@ItemCode and Active=1),0);
IF @AvailableItemCount>@Quantity
BEGIN
SELECT @OrderID = OrderID,@OldOrderQuantity =Quantity ,@OldItemCode=ItemCode from TblexeOrder where OrderUno=@OrderUno
	If @OldOrderQuantity >0
			BEGIN
	 update TblMstInventory set Quantity= (Quantity+@OldOrderQuantity) where InventoryCode=@OldItemCode and   Active=1
				END
	Update TblexeOrder set OrderCode=@OrderCode,Quantity=@Quantity,CustomerUno=@CustomerUno,Mobile=@Mobile,StatusUno=@StatusUno,EnteredOn=@ServerTime,CustomerName=@CustomerName,ItemCode=@ItemCode,ItemName=@ItemName where OrderUno=@OrderUno

	SET @OutParameter=@@ROWCOUNT; 
	set @OutMessage='Order Updated Successfully with ORDER ID :'+@OrderID;
if @OutParameter>0
	BEGIN
	 update TblMstInventory set Quantity= (Quantity-@Quantity) where InventoryCode=@ItemCode and   Active=1
	END
END
ELSE
BEGIN
SET @OutParameter=0;
set @OutMessage='Item(s) are currently out of Stock';
END
END
END TRY

BEGIN CATCH
set @OutParameter=0
SET @OutMessage=ERROR_LINE()+';'+ERROR_MESSAGE()+';'+ERROR_NUMBER();
END CATCH

    -- Insert statements for procedure here
	 
END
GO
