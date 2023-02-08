package com.example;

import com.mathworks.engine.EngineException;
import com.mathworks.engine.MatlabEngine;

import java.util.concurrent.ExecutionException;

public class SimulinkRunner {
    static public void main(String[] args) throws ExecutionException, InterruptedException {
        MatlabEngine matlab = MatlabEngine.startMatlab();
        matlab.eval("clear;");
        matlab.eval("x = sin(3.1);");
        double x = matlab.getVariable("x");
        System.out.println(x);
    }
}
