using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace DMSWcfService.Code.ServiceLayer
{
    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class ServiceInvocationResult
    {
        int resultCode;
        string resultMsg;
        string errorInfo;
        Exception innerException;

        public ServiceInvocationResult(int resultCode, string resultMsg, string errorInfo, Exception innerException)
        {
            this.resultCode = resultCode;
            this.resultMsg = resultMsg;
            this.errorInfo = errorInfo;
            this.innerException = innerException;
        }

        [DataMember]
        public int ResultCode
        {
            get { return resultCode; }
            set { resultCode = value; }
        }

        [DataMember]
        public string ResultMsg
        {
            get { return resultMsg; }
            set { resultMsg = value; }
        }

        [DataMember]
        public string ErrorInfo
        {
            get { return errorInfo; }
            set { errorInfo = value; }
        }

        public Exception InnerException
        {
            get { return innerException; }
            set { innerException = value; }
        }
    }

    public enum ServiceInvocationResultCode { OK=0, UpdatesNotAllowed=1, InternalError=2 }
}