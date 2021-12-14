pragma solidity ^0.5.0;

contract DStorage {
  string public name = "DStorage";
  uint public fileCount = 0;
  // Number of files
  // Mapping fileId=>Struct 

  mapping(uint => File) public files;
  // Struct
  struct File{
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDescription;
    uint uploadTime;
    address payable uploader;
  }

  // Event
  event fileUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName,
    string fileDescription,
    uint uploadTime,
    address payable uploader
  );
  constructor() public {

  }


  // Upload File function

  function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileType, 
  string memory _fileName, string memory _fileDescription )public {

    require(bytes(_fileHash).length >0);
    require(bytes(_fileType).length >0);
    require(bytes(_fileName).length>0);
    require(bytes(_fileDescription).length>0);
    require(_fileSize>0);
    require(msg.sender != address(0));

    fileCount++;
    files[fileCount] = File(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender);

    emit fileUploaded(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender);
  }
    // Trigger an event

}