%% Lab54_CarDetectionByGMM  
videoSource = vision.VideoFileReader('visiontraffic.avi', ...
    'ImageColorSpace','Intensity','VideoOutputDataType','uint8');
videoPlayer = vision.VideoPlayer();
videoFWriter = vision.VideoFileWriter('Lab54_VideoHW1.avi', ...
     'FrameRate',videoSource.info.VideoFrameRate);
% Create a FGD detector object and set the training frames to 5
detector = vision.ForegroundDetector(...
         'NumTrainingFrames',5,'InitialVariance', 30*30);
% Perform blob analysis
blob = vision.BlobAnalysis(...
       'CentroidOutputPort', false, 'AreaOutputPort', false, ...
       'BoundingBoxOutputPort', true, ...
       'MinimumBlobAreaSource', 'Property', 'MinimumBlobArea', 5);   
shapeInserter = vision.ShapeInserter('BorderColor','White');
% Frame analysis across the video
while ~isDone(videoSource)
      frame  = videoSource();
      FgMask = detector(frame);
      bbox   = blob(FgMask);
      [bboxNum, bboxLocation] = size(bbox);
      for i = 1:bboxNum
          bbox(i, 1) = bbox(i, 1) + (bbox(i,3)/3);
          bbox(i, 3) = bbox(i, 3) * (2/3);
      end
      
      RefinedFrame = shapeInserter(frame,bbox);
      videoPlayer(RefinedFrame); 
      pause(0.3);
end
release(videoSource);
release(videoPlayer);
release(videoFWriter);