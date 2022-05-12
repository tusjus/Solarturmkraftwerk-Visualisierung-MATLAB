clf, hold on 

S = sum(Mirror1_s.z);
idx = S== max(S);

Mirror1top_s.x = Mirror1_s.x(:,idx);
Mirror1top_s.y = Mirror1_s.y(:,idx);
Mirror1top_s.z = Mirror1_s.z(:,idx);

Mirror1bot_s.x = Mirror1_s.x(:,~idx);
Mirror1bot_s.y = Mirror1_s.y(:,~idx);
Mirror1bot_s.z = Mirror1_s.z(:,~idx);

patch(Mirror1bot_s.x,Mirror1bot_s.y,Mirror1bot_s.z,'r');
patch(Mirror1top_s.x,Mirror1top_s.y,Mirror1top_s.z,'b');

