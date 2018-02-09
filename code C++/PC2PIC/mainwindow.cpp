#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    myPort = new QSerialPort();
    myPort->setPortName("COM1");
    myPort->setBaudRate(QSerialPort::Baud115200);
    myPort->setDataBits(QSerialPort::Data8);
    myPort->setParity(QSerialPort::NoParity);
    myPort->setStopBits(QSerialPort::OneStop);
    myPort->setFlowControl(QSerialPort::NoFlowControl);

    if(!myPort->isOpen()){
        qDebug() << "Open Connection";
        myPort->open(QIODevice::ReadWrite);
    }


}

MainWindow::~MainWindow()
{
    delete ui;
}

// Red
void MainWindow::on_pushButton_clicked()
{
    myPort->write("R");
}

// Yellow
void MainWindow::on_pushButton_2_clicked()
{
    myPort->write("Y");
}

// LCD
void MainWindow::on_pushButton_3_clicked()
{
    myPort->write("L");
}
