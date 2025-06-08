unit ufCharts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  VclTee.TeEngine, Vcl.ExtCtrls, VclTee.TeeProcs, VclTee.Chart, VclTee.Series, uTypes;

type
  TCharts = class(TForm)
    lblSquareMain: TLabel;
    chrtSquareBuckets: TChart;
    chrtSquareSearch: TChart;
    chrtShiftBuckets: TChart;
    lblShiftMain: TLabel;
    chrtShiftSearch: TChart;
    procedure AddSeries(const StatisticsSquare, StatisticsShift: TStatistics);
    procedure AddCombinedSeries(Chart: TChart; const Stats: TStatistics;
  const Title: string; BarColor, LineColor: TColor);
    procedure AddTimeSeries(Chart: TChart; const Stats: TStatistics;
  const Title: string; BarColor: TColor);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Charts: TCharts;

implementation

{$R *.dfm}

procedure TCharts.AddSeries(const StatisticsSquare, StatisticsShift
  : TStatistics);
var
  i: Integer;
begin
  chrtSquareBuckets.ClearChart;
  chrtSquareSearch.ClearChart;
  chrtShiftBuckets.ClearChart;
  chrtShiftSearch.ClearChart;

  AddCombinedSeries(chrtSquareBuckets, StatisticsSquare, 'Square method',
    clBlue, clRed);

  AddTimeSeries(chrtSquareSearch, StatisticsSquare,
    'Search time (Square)', clGreen);

  AddCombinedSeries(chrtShiftBuckets, StatisticsShift, 'Shift method', clNavy,
    clPurple);

  AddTimeSeries(chrtShiftSearch, StatisticsShift, 'Search time (Shift)',
    clMaroon);
end;

// Вспомогательные методы:

procedure TCharts.AddCombinedSeries(Chart: TChart; const Stats: TStatistics;
  const Title: string; BarColor, LineColor: TColor);
var
  BarSeries: TBarSeries;
  LineSeries: TLineSeries;
  i: Integer;
begin
  Chart.Title.Text.Clear;
  Chart.Title.Text.Add(Title);
  Chart.View3D := False;
  Chart.Legend.Visible := True;

  // Настройка оси X
  Chart.Axes.Bottom.LabelStyle := talText; // Используем текстовые метки
  Chart.Axes.Bottom.LabelsAngle := 90;    // Поворачиваем метки на 90°

  // Столбчатая диаграмма
  BarSeries := TBarSeries.Create(Chart);
  BarSeries.Title := 'Main';
  BarSeries.SeriesColor := BarColor;
  BarSeries.Marks.Visible := False;
  Chart.AddSeries(BarSeries);

  // Линейный график
  LineSeries := TLineSeries.Create(Chart);
  LineSeries.Title := 'Overflow';
  LineSeries.SeriesColor := LineColor;
  LineSeries.LinePen.Width := 3;
  LineSeries.Pointer.Style := psCircle;
  LineSeries.Pointer.Visible := True;
  Chart.AddSeries(LineSeries);

  // Добавляем точки с индексами вместо TableSize
  for i := Low(Stats) to High(Stats) do
  begin
    BarSeries.AddXY(i, Stats[i].Main, IntToStr(Stats[i].TableSize));
    LineSeries.AddXY(i, Stats[i].Collisions);
  end;
end;

procedure TCharts.AddTimeSeries(Chart: TChart; const Stats: TStatistics;
  const Title: string; BarColor: TColor);
var
  BarSeries: TBarSeries;
  i: Integer;
begin
  Chart.Title.Text.Clear;
  Chart.Title.Text.Add(Title);
  Chart.View3D := False;
  Chart.Legend.Visible := False;

  // Настройка оси X
  Chart.Axes.Bottom.LabelStyle := talText;
  Chart.Axes.Bottom.LabelsAngle := 90;

  BarSeries := TBarSeries.Create(Chart);
  BarSeries.SeriesColor := BarColor;
  BarSeries.Marks.Visible := True;
  BarSeries.Marks.Style := smsValue;
  Chart.AddSeries(BarSeries);

  for i := Low(Stats) to High(Stats) do
  begin
    BarSeries.AddXY(i, Stats[i].SearchTime, IntToStr(Stats[i].TableSize)); // Метка для оси X
  end;
end;

end.
