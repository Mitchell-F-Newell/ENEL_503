%% Lab53_Facial Sequence Detection
% 1) Initial the Cascade Facial Detector by ML   
faceDetector = vision.CascadeObjectDetector();
videoFReader = vision.VideoFileReader('Lab53_Sample_TStage.mp4');
videoPlayer = vision.VideoPlayer();
% videoFWriter = vision.VideoFileWriter('Lab53_FacialSeqenceRecognition.avi', ...
%                'FrameRate',videoFReader.info.VideoFrameRate);
Frame = step(videoFReader);
step(videoPlayer, Frame);

% 2) Detect faces in each frame where F# >= F200   
fn = 0;
while ~isDone(videoFReader)
   fn = fn + 1;
   if fn < 200    % By pass the first 200 frames
      Frame = step(videoFReader);
   else
      % Analyze each frame for facial detection
      Frame = step(videoFReader);
      step(videoPlayer, Frame);
      bbox = step(faceDetector, Frame);
      Faces = insertShape(Frame, 'Rectangle', bbox); 
      
      % 3) Solution: Insert labels for each face identified
        [bboxNum, bboxLocation] = size(bbox);
        for i = 1:bboxNum
            Labels = strcat('F:', num2str(fn),' | ID:#', num2str(i));
            location = bbox(i, 1:2);
            Faces = insertText(Faces, location, Labels);
        end
      % 4) Show identified faces 
      videoPlayer(Faces);
      % videoFWriter(FacesL);
   end
end
release(faceDetector);
release(videoPlayer);
release(videoFReader);
% release(videoFWriter);