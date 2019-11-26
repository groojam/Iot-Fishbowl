import  wx



# Define the tab content as classes:
class HomeTab(wx.Panel):
    def __init__(self, parent):
        wx.Panel.__init__(self, parent)
        #t = wx.StaticText(self, -1, "This is the first tab", (20,20))
        
        self.mainPanel = wx.Panel(self)

        self.gridSizer = wx.FlexGridSizer(rows=2, cols=4, hgap=5, vgap=5)

        self.mainSizer = wx.BoxSizer(wx.VERTICAL)
        self.h_box1 = wx.BoxSizer(wx.HORIZONTAL)
        self.h_box2 = wx.BoxSizer(wx.HORIZONTAL)

        self.runEvent = wx.Panel(self.mainPanel)
        self.NowTemp = wx.Panel(self.mainPanel)
        self.Light = wx.Panel(self.mainPanel)
        self.Image = wx.Panel(self.mainPanel)
        self.Heater = wx.Panel(self.mainPanel)
        self.Extra = wx.Panel(self.mainPanel)

        self.testButton = wx.Button(self.runEvent, label="test")
        self.testButton = wx.Button(self.NowTemp, label="test")
        self.testButton = wx.Button(self.Image, label="test")
        self.testButton = wx.Button(self.Light, label="test")
        self.testButton = wx.Button(self.Heater, label="test")
        

        self.mainSizer.Add(self.h_box1)
        self.mainSizer.Add(self.h_box2)
        self.h_box1.Add(self.runEvent, 0)
        self.h_box1.Add(self.NowTemp, 0)
        self.h_box1.Add(self.Light, 0)
        self.h_box2.Add(self.Image, 3, wx.ALIGN_LEFT | wx.ALL, 5)
        self.h_box2.Add(self.Heater, 1, wx.ALIGN_RIGHT)



        #self.gridSizer.Add(self.runEvent, 0, wx.EXPAND)
        #self.gridSizer.Add(self.NowTemp, 0, wx.EXPAND)
        #self.gridSizer.Add(self.Light, 0, wx.EXPAND)
        #self.gridSizer.Add(self.Image, 0, wx.EXPAND)
        #self.gridSizer.Add(self.Heater, 0, wx.EXPAND)
        #self.gridSizer.Add(self.Extra, 0, wx.EXPAND)
        
        self.mainPanel.SetSizer(self.mainSizer)


class ImageTab(wx.Panel):
    def __init__(self, parent):
        wx.Panel.__init__(self, parent)
        #t = wx.StaticText(self, -1, "This is the second tab", (20,20))
        self.MainPanel = wx.Panel(self)
        self.Count = wx.Panel(self.MainPanel)
        self.Status = wx.Panel(self.MainPanel)
        self.Searching = wx.Panel(self.MainPanel)
        self.ImageList = wx.Panel(self.MainPanel)
        self.Image = wx.Panel(self.MainPanel)
        self.Src_Result = wx.Panel(self.MainPanel)

        self.gridSizer = wx.FlexGridSizer(rows=2, cols=4, hgap=5, vgap=5)
        
        self.gridSizer.Add(self.Count, 0, wx.EXPAND)
        self.gridSizer.Add(self.Status, 0, wx.EXPAND)
        self.gridSizer.Add(self.Searching, 0, wx.EXPAND)
        self.gridSizer.Add(self.ImageList, 0, wx.EXPAND)
        self.gridSizer.Add(self.Image, 0, wx.EXPAND)
        self.gridSizer.Add(self.Src_Result, 0, wx.EXPAND)

        self.MainPanel.SetSizer(self.gridSizer)

class ThermTab(wx.Panel):
    def __init__(self, parent):
        wx.Panel.__init__(self, parent)
        #t = wx.StaticText(self, -1, "This is the third tab", (20,20))
        self.MainPanel = wx.Panel(self)
        self.NowTemp = wx.Panel(self.MainPanel)
        self.ChangeUnit = wx.Panel(self.MainPanel)
        self.Last_12hr = wx.Panel(self.MainPanel)
        self.DayGraph = wx.Panel(self.MainPanel)
        self.WeekGraph = wx.Panel(self.MainPanel)

class LightTab(wx.Panel):
    def __init__(self, parent):
        wx.Panel.__init__(self, parent)
        #t = wx.StaticText(self, -1, "This is the last tab", (20,20))
        self.MainPanel = wx.Panel(self)
        self.Status = wx.Panel(self.MainPanel)
        self.runEvent = wx.Panel(self.MainPanel)

        
class HeaterTab(wx.Panel):
    def __init__(self, parent):
        wx.Panel.__init__(self, parent)
        #t = wx.StaticText(self, -1, "This is the last tab", (20,20))
        self.MainPanel = wx.Panel(self)
        self.Status = wx.Panel(self.MainPanel)
        self.runEvent = wx.Panel(self.MainPanel)

class ExTab1(wx.Panel):
    def __init__(self, parent):
        wx.Panel.__init__(self, parent)
        t = wx.StaticText(self, -1, "새 장치 탭", (20,20))
    


class MainFrame(wx.Frame):
    def __init__(self):
        wx.Frame.__init__(self, None, title="어항관리 프로그램 v0.1")
        self.Bind(wx.EVT_CLOSE, self.OnClose)

        # Create a panel and notebook (tabs holder)
        p = wx.Panel(self)
        nb = wx.Notebook(p)

        # Create the tab windows
        tab1 = HomeTab(nb)
        tab2 = ImageTab(nb)
        tab3 = ThermTab(nb)
        tab4 = LightTab(nb)
        tab5 = HeaterTab(nb)
        tab6 = ExTab1(nb)

        # Add the windows to tabs and name them.
        nb.AddPage(tab1, "홈")
        nb.AddPage(tab2, "사진")
        nb.AddPage(tab3, "온도")
        nb.AddPage(tab4, "조명")
        nb.AddPage(tab5, "히터")
        nb.AddPage(tab6, "추가")

        # Set noteboook in a sizer to create the layout
        sizer = wx.BoxSizer()
        sizer.Add(nb, 1, wx.EXPAND)
        p.SetSizer(sizer)
    def OnClose(self, event):
        if wx.MessageBox("프로그램을 종료할까요?", "프로그램 종료 ",wx.YES_NO) != wx.YES:
            event.skip(False)
        else :
            self.Destroy()

if __name__ == "__main__":
    app = wx.App()
    MainFrame().Show()
    
    app.MainLoop()