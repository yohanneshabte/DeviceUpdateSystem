-- Device
CREATE TABLE [Device]
(
    [DeviceID] VARCHAR(50) NOT NULL,
    [DeviceSize] DECIMAL,
    [DeviceType] VARCHAR(50), -- this signifies the type of device i.e. Near storage, cold storage, and archive
    [DeviceAge] INT,
    [DeviceStorge] VARCHAR(50),
    [DeviceMake] VARCHAR(50),
    [LastSpinDate] DATE

    CONSTRAINT [PK_Device] PRIMARY KEY ([DeviceID] ASC)
);
GO

-- Project
CREATE TABLE [Project]
(
    [ProjectID] VARCHAR(50) NOT NULL,
    [ProjectName] VARCHAR(50),
    [ProjectType] VARCHAR(50), -- this shows if the project is to be deleted or not
    [ProjectStatus] VARCHAR(50),
    [ProjectDate] DATE,
    [ProjectSize] DECIMAL,
    [ProjectWeight] VARCHAR(50), -- this signifies weather the project is Essential / Non-Essential
    [ProjectPriority] VARCHAR(50), -- this helps catagorize projects as Low/Meduim/High
    [DeviceID] VARCHAR (50) NOT NULL
    CONSTRAINT [PK_Project] PRIMARY KEY ([ProjectID] ASC),
    CONSTRAINT [FK_Device] FOREIGN KEY ([DeviceID]) REFERENCES [Device] ([DeviceID])
);
GO